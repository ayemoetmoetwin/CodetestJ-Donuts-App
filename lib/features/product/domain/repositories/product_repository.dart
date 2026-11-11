import 'package:jdonuts_app/core/result/result.dart';
import 'package:jdonuts_app/features/product/domain/entities/catalog_product.dart';

abstract class ProductRepository {
  Future<Result<CatalogProduct>> find(String id);
}
