import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdonuts_app/core/database/database_provider.dart';
import 'package:jdonuts_app/core/database/database_seeder.dart';
import 'package:jdonuts_app/core/motion/motion.dart';
import 'package:jdonuts_app/core/network/catalog_api.dart';
import 'package:jdonuts_app/core/network/network_checker.dart';
import 'package:jdonuts_app/features/auth/data/auth_repository_impl.dart';
import 'package:jdonuts_app/features/auth/data/member_account_link.dart';
import 'package:jdonuts_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:jdonuts_app/features/home/data/home_repository_impl.dart';
import 'package:jdonuts_app/features/home/domain/repositories/home_repository.dart';
import 'package:jdonuts_app/features/product/data/product_repository_impl.dart';
import 'package:jdonuts_app/features/product/domain/repositories/product_repository.dart';
import 'package:jdonuts_app/features/cart/data/cart_repository_impl.dart';
import 'package:jdonuts_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:jdonuts_app/features/rewards/data/rewards_repository_impl.dart';
import 'package:jdonuts_app/features/rewards/domain/repositories/rewards_repository.dart';

final sessionStoreProvider = Provider<SessionStore>(
  (ref) => SecureSessionStore(),
);

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(databaseProvider));
});

final memberAccountLinkProvider = Provider<MemberAccountLink>((ref) {
  return MemberAccountLink(ref.watch(databaseProvider));
});

final catalogApiProvider = Provider<CatalogApi>((ref) {
  return LocalMockCatalogApi(
    () => rootBundle.loadString(DatabaseSeeder.catalogAsset),
    // Home shows the skeleton for this long while the mock catalog loads.
    latency: underTest ? Duration.zero : const Duration(seconds: 4),
  );
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return HomeRepositoryImpl(
    database,
    DatabaseSeeder(database),
    ref.watch(networkCheckerProvider),
    ref.watch(catalogApiProvider),
  );
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(ref.watch(databaseProvider));
});

final rewardsRepositoryProvider = Provider<RewardsRepository>((ref) {
  return RewardsRepositoryImpl(
    ref.watch(databaseProvider),
    ref.watch(sessionStoreProvider),
  );
});

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepositoryImpl(ref.watch(databaseProvider));
});

final showWelcomeProvider = StateProvider<bool>((ref) => false);

/// Branch index of the bottom navigation shell. Rewards replays its entrance
/// when this becomes the rewards branch.
final shellBranchProvider = StateProvider<int>((ref) => 0);
