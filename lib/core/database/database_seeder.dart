import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:jdonuts_app/core/database/app_database.dart';
import 'package:jdonuts_app/core/database/tables.dart';

class DatabaseSeeder {
  DatabaseSeeder(this._database, {AssetBundle? bundle})
    : _bundle = bundle ?? rootBundle;

  final AppDatabase _database;
  final AssetBundle _bundle;
  static const catalogAsset = 'assets/seed/catalog.json';

  Future<void> seedIfEmpty() async {
    await upsertCatalog();
  }

  static String? _rawCatalog;

  Future<void> upsertCatalog() async {
    final raw = _rawCatalog ??= await _bundle.loadString(catalogAsset);
    final json = jsonDecode(raw) as Map<String, dynamic>;
    await writeCatalog(json);
  }

  Future<void> writeCatalog(Map<String, dynamic> json) async {
    await _database.ensureChallengeClaimed();
    await _database.transaction(() => _write(json));
  }

  Future<void> _write(Map<String, dynamic> json) async {
    await _writeMember(json['member'] as Map<String, dynamic>);
    await _replaceProducts(json['products'] as List<dynamic>);
    await _replaceBanners(json['banners'] as List<dynamic>);
    await _replaceSections(json['sections'] as List<dynamic>);
    await _replaceShops(json['shops'] as List<dynamic>);
    await _replaceChallenges(json['challenges'] as List<dynamic>);
  }

  Future<void> _writeMember(Map<String, dynamic> json) async {
    // Refreshing the catalog must not wipe points or the rewards badge.
    final existing = await _database
        .select(_database.members)
        .getSingleOrNull();
    await _database
        .into(_database.members)
        .insertOnConflictUpdate(
          MembersCompanion.insert(
            id: Value(json['id'] as int),
            name: existing?.name ?? json['name'] as String,
            tier: existing?.tier ?? json['tier'] as String,
            points: existing?.points ?? json['points'] as int,
            pointsToNext: existing?.pointsToNext ?? json['pointsToNext'] as int,
            nextTier: existing?.nextTier ?? json['nextTier'] as String,
            tierProgress:
                existing?.tierProgress ??
                (json['tierProgress'] as num).toDouble(),
            notificationCount: json['notificationCount'] as int,
            rewardsBadge: existing?.rewardsBadge ?? json['rewardsBadge'] as int,
            photoAsset: json['photoAsset'] as String,
          ),
        );
  }

  Future<void> _replaceProducts(List<dynamic> rows) async {
    for (final row in rows.cast<Map<String, dynamic>>()) {
      await _database
          .into(_database.products)
          .insertOnConflictUpdate(
            ProductsCompanion.insert(
              id: row['id'] as String,
              code: row['code'] as String,
              name: row['name'] as String,
              priceMmk: row['priceMmk'] as int,
              isNew: Value(row['isNew'] as bool? ?? false),
              discountPercent: Value(row['discountPercent'] as int?),
              imageAsset: row['imageAsset'] as String,
              imageUrl: Value(row['imageUrl'] as String? ?? ''),
              description: row['description'] as String,
            ),
          );
    }
  }

  Future<void> _replaceBanners(List<dynamic> rows) async {
    for (final row in rows.cast<Map<String, dynamic>>()) {
      await _database
          .into(_database.banners)
          .insertOnConflictUpdate(
            BannersCompanion.insert(
              id: row['id'] as String,
              title: row['title'] as String,
              badge: row['badge'] as String,
              imageAsset: row['imageAsset'] as String,
              imageUrl: Value(row['imageUrl'] as String? ?? ''),
              position: row['position'] as int,
            ),
          );
    }
  }

  Future<void> _replaceSections(List<dynamic> rows) async {
    // Seasonal and Popular come from the JSON. Order Again keeps checkout items.
    final keptOrder =
        await (_database.select(_database.sectionProducts)
              ..where((row) => row.sectionId.equals(orderAgainSectionId))
              ..orderBy([(row) => OrderingTerm.asc(row.position)]))
            .get();
    await _database.delete(_database.sectionProducts).go();
    for (final row in rows.cast<Map<String, dynamic>>()) {
      final id = row['id'] as String;
      await _database
          .into(_database.sections)
          .insertOnConflictUpdate(
            SectionsCompanion.insert(
              id: id,
              title: row['title'] as String,
              position: row['position'] as int,
            ),
          );
      final ids = (row['productIds'] as List<dynamic>).cast<String>();
      for (var index = 0; index < ids.length; index++) {
        await _database
            .into(_database.sectionProducts)
            .insert(
              SectionProductsCompanion.insert(
                sectionId: id,
                productId: ids[index],
                position: index,
              ),
            );
      }
    }
    if (keptOrder.isEmpty) {
      return;
    }
    await (_database.delete(
      _database.sectionProducts,
    )..where((row) => row.sectionId.equals(orderAgainSectionId))).go();
    for (final link in keptOrder) {
      await _database
          .into(_database.sectionProducts)
          .insert(
            SectionProductsCompanion.insert(
              sectionId: link.sectionId,
              productId: link.productId,
              position: link.position,
            ),
          );
    }
  }

  Future<void> _replaceShops(List<dynamic> rows) async {
    for (final row in rows.cast<Map<String, dynamic>>()) {
      await _database
          .into(_database.shops)
          .insertOnConflictUpdate(
            ShopsCompanion.insert(
              id: row['id'] as String,
              name: row['name'] as String,
              address: row['address'] as String,
              distanceLabel: row['distanceLabel'] as String,
              imageAsset: row['imageAsset'] as String,
              imageUrl: Value(row['imageUrl'] as String? ?? ''),
              position: row['position'] as int,
            ),
          );
    }
  }

  Future<void> _replaceChallenges(List<dynamic> rows) async {
    for (final row in rows.cast<Map<String, dynamic>>()) {
      final id = row['id'] as String;
      final existing = await (_database.select(
        _database.challenges,
      )..where((item) => item.id.equals(id))).getSingleOrNull();
      await _database
          .into(_database.challenges)
          .insertOnConflictUpdate(
            ChallengesCompanion.insert(
              id: id,
              title: row['title'] as String,
              progress: existing?.progress ?? row['progress'] as int,
              goal: row['goal'] as int,
              rewardPoints: row['rewardPoints'] as int,
              art: row['art'] as String,
              tabKind: row['tabKind'] as String,
              position: row['position'] as int,
              claimed: Value(existing?.claimed ?? false),
            ),
          );
    }
  }
}
