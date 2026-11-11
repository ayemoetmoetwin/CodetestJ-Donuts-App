import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdonuts_app/core/locale/locale_controller.dart';
import 'package:jdonuts_app/core/network/network_checker.dart';
import 'package:jdonuts_app/core/router/app_router.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/core/widgets/offline_banner.dart';
import 'package:jdonuts_app/features/home/presentation/catalog_providers.dart';
import 'package:jdonuts_app/l10n/generated/app_localizations.dart';

class JDonutsApp extends ConsumerWidget {
  const JDonutsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(networkStatusProvider, (previous, next) {
      final cameOnline = previous?.value == false && next.value == true;
      if (!cameOnline) {
        return;
      }
      ref.invalidate(homeProvider);
      ref.invalidate(rewardsProvider);
    });
    final saved = ref.watch(localeProvider).asData?.value;
    return MaterialApp.router(
      title: "J'Donuts App",
      theme: buildAppTheme(),
      locale: switch (saved) {
        'en' => const Locale('en'),
        'my' => const Locale('my'),
        _ => null,
      },
      routerConfig: ref.watch(routerProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        return Column(
          children: [
            const OfflineBanner(),
            Expanded(child: child ?? const SizedBox.shrink()),
          ],
        );
      },
    );
  }
}
