import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdonuts_app/core/network/network_checker.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/l10n/generated/app_localizations.dart';

class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final online = ref.watch(networkStatusProvider).value ?? true;
    if (online) {
      return const SizedBox.shrink();
    }
    final l10n = AppLocalizations.of(context);
    return Material(
      color: AppColors.ink,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          child: Text(
            l10n.offlineBanner,
            textAlign: TextAlign.center,
            style: AppTypography.small.copyWith(color: AppColors.surface),
          ),
        ),
      ),
    );
  }
}
