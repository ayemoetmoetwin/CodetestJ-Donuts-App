import 'dart:math' as math;

import 'package:drift/drift.dart';
import 'package:jdonuts_app/core/database/app_database.dart' as db;
import 'package:jdonuts_app/core/database/tables.dart';
import 'package:jdonuts_app/core/failure/app_failure.dart';
import 'package:jdonuts_app/core/result/result.dart';
import 'package:jdonuts_app/features/cart/domain/entities/cart_line.dart';
import 'package:jdonuts_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:jdonuts_app/features/home/data/home_repository_impl.dart';
import 'package:jdonuts_app/features/rewards/domain/challenge_match.dart';

class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl(this._database);

  final db.AppDatabase _database;

  @override
  Future<Result<List<CartLine>>> load() async {
    try {
      final rows = await _database.select(_database.cartLines).get();
      final lines = <CartLine>[];
      for (final row in rows) {
        final product = await (_database.select(
          _database.products,
        )..where((item) => item.id.equals(row.productId))).getSingleOrNull();
        if (product == null) {
          continue;
        }
        lines.add(
          CartLine(product: mapProduct(product), quantity: row.quantity),
        );
      }
      return Success(lines);
    } on Object {
      return const Failure(DatabaseFailure());
    }
  }

  @override
  Future<Result<void>> add(String productId, int quantity) async {
    if (quantity < 1) {
      return const Success(null);
    }
    try {
      final existing = await _line(productId);
      if (existing == null) {
        await _database
            .into(_database.cartLines)
            .insert(
              db.CartLinesCompanion.insert(
                productId: productId,
                quantity: quantity,
              ),
            );
      } else {
        await _writeQuantity(productId, existing.quantity + quantity);
      }
      return const Success(null);
    } on Object {
      return const Failure(DatabaseFailure());
    }
  }

  @override
  Future<Result<void>> setQuantity(String productId, int quantity) async {
    try {
      if (quantity < 1) {
        await (_database.delete(
          _database.cartLines,
        )..where((row) => row.productId.equals(productId))).go();
        return const Success(null);
      }
      await _writeQuantity(productId, quantity);
      return const Success(null);
    } on Object {
      return const Failure(DatabaseFailure());
    }
  }

  @override
  Future<Result<void>> checkout() async {
    try {
      await _database.ensureChallengeClaimed();
      await _database.transaction(() async {
        final rows = await _database.select(_database.cartLines).get();
        final bought = <String>[];
        for (final row in rows) {
          final product = await (_database.select(
            _database.products,
          )..where((item) => item.id.equals(row.productId))).getSingleOrNull();
          if (product == null) {
            continue;
          }
          bought.add(product.id);
          await _applyPurchase(product.name, row.quantity);
        }
        // Checked-out products move to the front of Order Again, then the cart clears.
        await _rememberOrder(bought);
        await _database.delete(_database.cartLines).go();
      });
      return const Success(null);
    } on Object {
      return const Failure(DatabaseFailure());
    }
  }

  Future<void> _applyPurchase(String productName, int quantity) async {
    if (quantity < 1) {
      return;
    }
    final challenges = await _database.select(_database.challenges).get();
    for (final row in challenges) {
      if (row.claimed || row.progress >= row.goal) {
        continue;
      }
      if (!challengeCountsProduct(row.id, productName)) {
        continue;
      }
      final next = math.min(row.goal, row.progress + quantity);
      await (_database.update(_database.challenges)
            ..where((item) => item.id.equals(row.id)))
          .write(db.ChallengesCompanion(progress: Value(next)));
    }
  }

  Future<void> _rememberOrder(List<String> productIds) async {
    if (productIds.isEmpty) {
      return;
    }
    final section = await (_database.select(
      _database.sections,
    )..where((row) => row.id.equals(orderAgainSectionId))).getSingleOrNull();
    if (section == null) {
      await _database
          .into(_database.sections)
          .insert(
            db.SectionsCompanion.insert(
              id: orderAgainSectionId,
              title: 'Order again',
              position: 2,
            ),
          );
    }
    final existing =
        await (_database.select(_database.sectionProducts)
              ..where((row) => row.sectionId.equals(orderAgainSectionId))
              ..orderBy([(row) => OrderingTerm.asc(row.position)]))
            .get();
    final seen = <String>{};
    final ordered = <String>[];
    for (final id in [...productIds, ...existing.map((row) => row.productId)]) {
      if (seen.add(id)) {
        ordered.add(id);
      }
    }
    await (_database.delete(
      _database.sectionProducts,
    )..where((row) => row.sectionId.equals(orderAgainSectionId))).go();
    for (var index = 0; index < ordered.length; index++) {
      await _database
          .into(_database.sectionProducts)
          .insert(
            db.SectionProductsCompanion.insert(
              sectionId: orderAgainSectionId,
              productId: ordered[index],
              position: index,
            ),
          );
    }
  }

  Future<db.CartLine?> _line(String productId) {
    return (_database.select(
      _database.cartLines,
    )..where((row) => row.productId.equals(productId))).getSingleOrNull();
  }

  Future<void> _writeQuantity(String productId, int quantity) {
    return (_database.update(_database.cartLines)
          ..where((row) => row.productId.equals(productId)))
        .write(db.CartLinesCompanion(quantity: Value(quantity)));
  }
}
