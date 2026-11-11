import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdonuts_app/core/database/database_provider.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/core/widgets/app_button.dart';
import 'package:jdonuts_app/features/auth/domain/auth_policy.dart';
import 'package:jdonuts_app/features/auth/domain/validators/dob_validator.dart';
import 'package:jdonuts_app/features/auth/presentation/auth_controller.dart';
import 'package:jdonuts_app/features/auth/presentation/auth_navigation.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/dob_wheels.dart';
import 'package:jdonuts_app/l10n/generated/app_localizations.dart';

class NameScreen extends ConsumerWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(authControllerProvider);
    final notifier = ref.read(authControllerProvider.notifier);
    return AuthScaffold(
      title: l10n.nameTitle,
      progress: RegisterProgress.name,
      body: ListView(
        children: [
          AuthField(
            key: const Key('first-name'),
            hint: l10n.firstName,
            initialValue: state.firstName,
            error: _message(l10n, state.firstNameError),
            onChanged: notifier.setFirstName,
            onUnfocus: notifier.touchName,
          ),
          const SizedBox(height: AppSpacing.md),
          AuthField(
            key: const Key('last-name'),
            hint: l10n.lastName,
            initialValue: state.lastName,
            error: _message(l10n, state.lastNameError),
            onChanged: notifier.setLastName,
            onUnfocus: notifier.touchName,
          ),
        ],
      ),
      footer: AppButton(
        key: const Key('continue-button'),
        label: l10n.continueLabel,
        loading: state.submitting,
        onPressed: state.nameReady
            ? () => followAuth(context, notifier.submitName())
            : null,
      ),
    );
  }

  String? _message(AppLocalizations l10n, String? code) {
    final message = fieldMessage(l10n, code);
    return message.isEmpty ? null : message;
  }
}

class DobScreen extends ConsumerWidget {
  const DobScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(authControllerProvider);
    final notifier = ref.read(authControllerProvider.notifier);
    final today = ref.read(clockProvider)();
    final message = fieldMessage(l10n, state.dobError(today));
    return AuthScaffold(
      title: l10n.dobTitle,
      progress: RegisterProgress.dob,
      showCheck: true,
      body: ListView(
        children: [
          _DobField(
            key: const Key('dob-month'),
            hint: l10n.monthHint,
            value: _monthLabel(state.month),
            onTap: () => _openDateSheet(context),
          ),
          const SizedBox(height: AppSpacing.md),
          _DobField(
            key: const Key('dob-day'),
            hint: l10n.dayHint,
            value: _plain(state.day),
            onTap: () => _openDateSheet(context),
          ),
          const SizedBox(height: AppSpacing.md),
          _DobField(
            key: const Key('dob-year'),
            hint: l10n.yearHint,
            value: _plain(state.year),
            error: message.isEmpty ? null : message,
            onTap: () => _openDateSheet(context),
          ),
        ],
      ),
      footer: AppButton(
        key: const Key('continue-button'),
        label: l10n.continueLabel,
        loading: state.submitting,
        onPressed: state.dobReady(today)
            ? () => followAuth(context, notifier.submitDob())
            : null,
      ),
    );
  }
}

void _openDateSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: AppColors.authBackground,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppSpacing.cardRadius),
      ),
    ),
    builder: (context) => const DobPickerSheet(),
  );
}

String? _plain(String raw) {
  final trimmed = raw.trim();
  return trimmed.isEmpty ? null : trimmed;
}

String? _monthLabel(String raw) {
  final parsed = parseMonth(raw);
  if (parsed == null || parsed < 1 || parsed > 12) {
    return _plain(raw);
  }
  return monthWheelLabel(parsed);
}

class _DobField extends StatelessWidget {
  const _DobField({
    required this.hint,
    required this.onTap,
    this.value,
    this.error,
    super.key,
  });

  final String hint;
  final String? value;
  final String? error;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final shown = value;
    final filled = shown != null && shown.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.md,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
                border: Border.all(
                  color: error == null ? AppColors.line : AppColors.danger,
                ),
              ),
              child: Text(
                filled ? shown : hint,
                style: AppTypography.section.copyWith(
                  fontWeight: FontWeight.w600,
                  color: filled ? AppColors.text : AppColors.textMuted,
                ),
              ),
            ),
          ),
        ),
        if (error != null && error!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              top: AppSpacing.xs,
              left: AppSpacing.xs,
            ),
            child: Text(
              error!,
              style: AppTypography.body.copyWith(color: AppColors.danger),
            ),
          ),
      ],
    );
  }
}
