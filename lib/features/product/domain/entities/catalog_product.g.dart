// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CatalogProduct _$CatalogProductFromJson(Map<String, dynamic> json) =>
    _CatalogProduct(
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      priceMmk: (json['priceMmk'] as num).toInt(),
      isNew: json['isNew'] as bool,
      discountPercent: (json['discountPercent'] as num?)?.toInt(),
      imageAsset: json['imageAsset'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CatalogProductToJson(_CatalogProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'priceMmk': instance.priceMmk,
      'isNew': instance.isNew,
      'discountPercent': instance.discountPercent,
      'imageAsset': instance.imageAsset,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
    };
