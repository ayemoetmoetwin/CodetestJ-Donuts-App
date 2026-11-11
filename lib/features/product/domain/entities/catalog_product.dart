import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_product.freezed.dart';
part 'catalog_product.g.dart';

@freezed
abstract class CatalogProduct with _$CatalogProduct {
  const factory CatalogProduct({
    required String id,
    required String code,
    required String name,
    required int priceMmk,
    required bool isNew,
    required int? discountPercent,
    required String imageAsset,
    required String imageUrl,
    required String description,
  }) = _CatalogProduct;

  factory CatalogProduct.fromJson(Map<String, dynamic> json) =>
      _$CatalogProductFromJson(json);
}
