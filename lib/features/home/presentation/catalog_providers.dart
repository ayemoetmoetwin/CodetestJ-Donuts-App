import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdonuts_app/core/providers.dart';
import 'package:jdonuts_app/core/result/result.dart';
import 'package:jdonuts_app/features/cart/domain/entities/cart_line.dart';
import 'package:jdonuts_app/features/home/domain/entities/home_snapshot.dart';
import 'package:jdonuts_app/features/product/domain/entities/catalog_product.dart';
import 'package:jdonuts_app/features/rewards/domain/entities/rewards_snapshot.dart';

final homeProvider = FutureProvider<Result<HomeSnapshot>>((ref) {
  return ref.watch(homeRepositoryProvider).load();
});

final productProvider = FutureProvider.family<Result<CatalogProduct>, String>((
  ref,
  id,
) {
  return ref.watch(productRepositoryProvider).find(id);
});

final rewardsProvider = FutureProvider<Result<RewardsSnapshot>>((ref) {
  return ref.watch(rewardsRepositoryProvider).load();
});

final cartProvider = FutureProvider<Result<List<CartLine>>>((ref) {
  return ref.watch(cartRepositoryProvider).load();
});
