import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jdonuts_app/core/database/database_provider.dart';
import 'package:jdonuts_app/core/database/tables.dart';
import 'package:jdonuts_app/core/database/database_seeder.dart';
import 'package:jdonuts_app/core/providers.dart';
import 'package:jdonuts_app/core/router/shared_axis_page.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/features/auth/presentation/screens/onboarding_screen.dart';
import 'package:jdonuts_app/features/auth/presentation/screens/otp_screen.dart';
import 'package:jdonuts_app/features/auth/presentation/screens/phone_screen.dart';
import 'package:jdonuts_app/features/auth/presentation/screens/profile_screens.dart';
import 'package:jdonuts_app/features/auth/presentation/screens/welcome_screen.dart';
import 'package:jdonuts_app/features/auth/presentation/session_controller.dart';
import 'package:jdonuts_app/features/home/presentation/home_screen.dart';
import 'package:jdonuts_app/features/cart/presentation/cart_screen.dart';
import 'package:jdonuts_app/features/product/domain/entities/catalog_product.dart';
import 'package:jdonuts_app/features/product/presentation/product_detail_screen.dart';
import 'package:jdonuts_app/features/rewards/presentation/rewards_screen.dart';
import 'package:jdonuts_app/features/shell/presentation/app_shell.dart';

final appBootstrapProvider = FutureProvider<void>((ref) async {
  await DatabaseSeeder(ref.watch(databaseProvider)).seedIfEmpty();
  final session = await ref.read(sessionProvider.future);
  if (session != null) {
    await ref.read(memberAccountLinkProvider).apply(session);
  }
});

final routerProvider = Provider<GoRouter>((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final refresh = ValueNotifier<int>(0);
  ref.onDispose(refresh.dispose);
  ref.listen(appBootstrapProvider, (_, _) => refresh.value++);
  ref.listen(sessionProvider, (_, _) => refresh.value++);
  ref.listen(showWelcomeProvider, (_, _) => refresh.value++);
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/splash',
    refreshListenable: refresh,
    redirect: (context, state) => _redirect(ref, state.matchedLocation),
    routes: [
      GoRoute(path: '/splash', builder: (_, _) => const _Splash()),
      GoRoute(
        path: '/onboarding',
        pageBuilder: (context, state) => sharedAxisPage(
          pageKey: state.pageKey,
          reduced: reducedMotion(context),
          child: const OnboardingScreen(),
        ),
      ),
      GoRoute(
        path: '/auth/phone',
        pageBuilder: (context, state) => sharedAxisPage(
          pageKey: state.pageKey,
          reduced: reducedMotion(context),
          child: const PhoneScreen(),
        ),
      ),
      GoRoute(
        path: '/auth/otp',
        pageBuilder: (context, state) => sharedAxisPage(
          pageKey: state.pageKey,
          reduced: reducedMotion(context),
          child: const OtpScreen(),
        ),
      ),
      GoRoute(
        path: '/auth/name',
        pageBuilder: (context, state) => sharedAxisPage(
          pageKey: state.pageKey,
          reduced: reducedMotion(context),
          child: const NameScreen(),
        ),
      ),
      GoRoute(
        path: '/auth/dob',
        pageBuilder: (context, state) => sharedAxisPage(
          pageKey: state.pageKey,
          reduced: reducedMotion(context),
          child: const DobScreen(),
        ),
      ),
      GoRoute(
        path: '/welcome',
        pageBuilder: (context, state) => sharedAxisPage(
          pageKey: state.pageKey,
          reduced: reducedMotion(context),
          child: const WelcomeScreen(),
        ),
      ),
      GoRoute(
        path: '/product/:id',
        parentNavigatorKey: rootNavigatorKey,
        builder: (_, state) {
          final extra = state.extra;
          return ProductDetailScreen(
            id: state.pathParameters['id']!,
            initial: extra is CatalogProduct ? extra : null,
            fromSeasonal:
                state.uri.queryParameters['section'] == seasonalSectionId,
          );
        },
      ),
      GoRoute(
        path: '/cart',
        parentNavigatorKey: rootNavigatorKey,
        builder: (_, _) => const CartScreen(),
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, shell) => homeArrivalPage(
          pageKey: state.pageKey,
          reduced: reducedMotion(context),
          child: AppShell(navigationShell: shell),
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/home', builder: (_, _) => const HomeScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorites',
                builder: (_, _) => const CartScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/rewards',
                builder: (_, _) => const RewardsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/inbox',
                builder: (_, _) => const PlaceholderTab(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (_, _) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

String? _redirect(Ref ref, String location) {
  final boot = ref.read(appBootstrapProvider);
  if (boot.isLoading || boot.hasError) {
    return location == '/splash' ? null : '/splash';
  }
  final authed = ref.read(sessionProvider).asData?.value != null;
  final welcome = ref.read(showWelcomeProvider);
  final authFlow = location == '/onboarding' || location.startsWith('/auth');
  if (!authed) {
    if (location == '/splash' || location == '/welcome' || !authFlow) {
      return '/onboarding';
    }
    return null;
  }
  if (welcome && location != '/welcome') {
    return '/welcome';
  }
  // OTP goes to Home itself so that page change can animate.
  if (!welcome &&
      (location == '/splash' ||
          location == '/welcome' ||
          (authFlow && location != '/auth/otp'))) {
    return '/home';
  }
  return null;
}

class _Splash extends StatelessWidget {
  const _Splash();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: Text("J'Donuts", style: AppTypography.splash)),
    );
  }
}
