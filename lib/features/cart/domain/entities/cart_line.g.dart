// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartLine _$CartLineFromJson(Map<String, dynamic> json) => _CartLine(
  product: CatalogProduct.fromJson(json['product'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$CartLineToJson(_CartLine instance) => <String, dynamic>{
  'product': instance.product.toJson(),
  'quantity': instance.quantity,
};
