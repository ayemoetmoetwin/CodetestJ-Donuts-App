import 'package:jdonuts_app/core/database/app_database.dart' as db;
import 'package:jdonuts_app/core/failure/app_failure.dart';
import 'package:jdonuts_app/core/result/result.dart';
import 'package:jdonuts_app/features/home/data/home_repository_impl.dart';
import 'package:jdonuts_app/features/product/domain/entities/catalog_product.dart';
import 'package:jdonuts_app/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this._database);

  final db.AppDatabase _database;

  @override
  Future<Result<CatalogProduct>> find(String id) async {
    try {
      final row = await (_database.select(
        _database.products,
      )..where((product) => product.id.equals(id))).getSingleOrNull();
      if (row == null) {
        return const Failure(NotFoundFailure());
      }
      return Success(mapProduct(row));
    } on Object {
      return const Failure(DatabaseFailure());
    }
  }
}
