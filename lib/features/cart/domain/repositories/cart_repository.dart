import 'package:jdonuts_app/core/result/result.dart';
import 'package:jdonuts_app/features/cart/domain/entities/cart_line.dart';

abstract class CartRepository {
  Future<Result<List<CartLine>>> load();

  Future<Result<void>> add(String productId, int quantity);

  Future<Result<void>> setQuantity(String productId, int quantity);

  Future<Result<void>> checkout();
}
