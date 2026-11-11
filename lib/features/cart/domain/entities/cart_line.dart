import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jdonuts_app/features/product/domain/entities/catalog_product.dart';

part 'cart_line.freezed.dart';
part 'cart_line.g.dart';

@freezed
abstract class CartLine with _$CartLine {
  const CartLine._();

  const factory CartLine({
    required CatalogProduct product,
    required int quantity,
  }) = _CartLine;

  factory CartLine.fromJson(Map<String, dynamic> json) =>
      _$CartLineFromJson(json);

  int get lineTotal => product.priceMmk * quantity;
}
