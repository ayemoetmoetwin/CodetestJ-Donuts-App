import 'package:drift/drift.dart';
import 'package:jdonuts_app/core/database/app_database.dart' as db;
import 'package:jdonuts_app/core/database/database_seeder.dart';
import 'package:jdonuts_app/core/failure/app_failure.dart';
import 'package:jdonuts_app/core/network/catalog_api.dart';
import 'package:jdonuts_app/core/network/network_checker.dart';
import 'package:jdonuts_app/core/result/result.dart';
import 'package:jdonuts_app/features/home/domain/entities/home_snapshot.dart';
import 'package:jdonuts_app/features/home/domain/repositories/home_repository.dart';
import 'package:jdonuts_app/features/product/domain/entities/catalog_product.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._database, this._seeder, this._network, this._api);

  final db.AppDatabase _database;
  final DatabaseSeeder _seeder;
  final NetworkChecker _network;
  final CatalogApi _api;

  @override
  Future<Result<HomeSnapshot>> load() async {
    await _syncQuietly();
    try {
      // Same members row Rewards uses. Sections were copied from the seed JSON.
      final member = await _database.select(_database.members).getSingle();
      final sections = await (_database.select(
        _database.sections,
      )..orderBy([(row) => OrderingTerm.asc(row.position)])).get();
      return Success(
        HomeSnapshot(
          member: _member(member),
          banners: await _banners(),
          sections: await _sections(sections),
          shops: await _shops(),
        ),
      );
    } on Object {
      return const Failure(DatabaseFailure());
    }
  }

  @override
  Future<Result<void>> refresh() async {
    await _syncQuietly();
    return const Success(null);
  }

  Future<void> _syncQuietly() async {
    try {
      if (!await _network.isOnline()) {
        return;
      }
      final response = await _api.get(CatalogApi.catalogPath);
      final data = response.data;
      if (!response.ok || data == null) {
        return;
      }
      await _seeder.writeCatalog(data);
    } on Object {
      return;
    }
  }

  Future<Result<List<PromoBanner>>> _banners() async {
    try {
      final rows = await (_database.select(
        _database.banners,
      )..orderBy([(row) => OrderingTerm.asc(row.position)])).get();
      return Success(rows.map(_banner).toList());
    } on Object {
      return const Failure(DatabaseFailure());
    }
  }

  Future<Result<List<Shop>>> _shops() async {
    try {
      final rows = await (_database.select(
        _database.shops,
      )..orderBy([(row) => OrderingTerm.asc(row.position)])).get();
      return Success(rows.map(_shop).toList());
    } on Object {
      return const Failure(DatabaseFailure());
    }
  }

  Future<List<HomeSection>> _sections(List<db.Section> rows) async {
    final built = <HomeSection>[];
    for (final section in rows) {
      built.add(
        HomeSection(
          id: section.id,
          title: section.title,
          products: await _products(section.id),
        ),
      );
    }
    return built;
  }

  Future<Result<List<CatalogProduct>>> _products(String sectionId) async {
    try {
      final links =
          await (_database.select(_database.sectionProducts)
                ..where((row) => row.sectionId.equals(sectionId))
                ..orderBy([(row) => OrderingTerm.asc(row.position)]))
              .get();
      final products = <CatalogProduct>[];
      for (final link in links) {
        final row = await (_database.select(
          _database.products,
        )..where((product) => product.id.equals(link.productId))).getSingle();
        products.add(mapProduct(row));
      }
      return Success(products);
    } on Object {
      return const Failure(DatabaseFailure());
    }
  }

  MemberProfile _member(db.Member row) {
    return MemberProfile(
      name: row.name,
      tier: row.tier,
      points: row.points,
      pointsToNext: row.pointsToNext,
      nextTier: row.nextTier,
      tierProgress: row.tierProgress,
      notificationCount: row.notificationCount,
      rewardsBadge: row.rewardsBadge,
      photoAsset: row.photoAsset,
    );
  }

  PromoBanner _banner(db.Banner row) {
    return PromoBanner(
      id: row.id,
      title: row.title,
      badge: row.badge,
      imageAsset: row.imageAsset,
      imageUrl: row.imageUrl,
    );
  }

  Shop _shop(db.Shop row) {
    return Shop(
      id: row.id,
      name: row.name,
      address: row.address,
      distanceLabel: row.distanceLabel,
      imageAsset: row.imageAsset,
      imageUrl: row.imageUrl,
    );
  }
}

CatalogProduct mapProduct(db.Product row) {
  return CatalogProduct(
    id: row.id,
    code: row.code,
    name: row.name,
    priceMmk: row.priceMmk,
    isNew: row.isNew,
    discountPercent: row.discountPercent,
    imageAsset: row.imageAsset,
    imageUrl: row.imageUrl,
    description: row.description,
  );
}
