import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/core/widgets/app_button.dart';
import 'package:jdonuts_app/features/auth/domain/auth_policy.dart';
import 'package:jdonuts_app/features/auth/presentation/auth_controller.dart';
import 'package:jdonuts_app/features/auth/presentation/auth_flow_state.dart';
import 'package:jdonuts_app/features/auth/presentation/auth_navigation.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:jdonuts_app/l10n/generated/app_localizations.dart';

class PhoneScreen extends ConsumerWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(authControllerProvider);
    final notifier = ref.read(authControllerProvider.notifier);
    final error = fieldMessage(l10n, state.phoneError);
    return AuthScaffold(
      title: l10n.enterPhoneTitle,
      progress: RegisterProgress.phone,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthField(
            key: const Key('phone-field'),
            hint: '9xxxxxxxxx',
            prefix: '+95 ',
            initialValue: state.phone,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: false,
              signed: false,
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            error: error.isEmpty ? null : error,
            onChanged: notifier.setPhone,
            onUnfocus: notifier.touchPhone,
          ),
          if (state.banner != AuthBanner.none) _Banner(state: state),
        ],
      ),
      footer: AppButton(
        key: const Key('continue-button'),
        label: l10n.continueLabel,
        loading: state.submitting,
        onPressed: state.phoneReady
            ? () => followAuth(context, notifier.submitPhone())
            : null,
      ),
    );
  }
}

class _Banner extends ConsumerWidget {
  const _Banner({required this.state});

  final AuthFlowState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final register = state.banner == AuthBanner.notRegistered;
    final message = register ? l10n.notRegistered : l10n.alreadyRegistered;
    final action = register ? l10n.registerAction : l10n.logIn;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Text.rich(
        TextSpan(
          text: message,
          style: AppTypography.body.copyWith(color: AppColors.danger),
          children: [
            WidgetSpan(
              child: GestureDetector(
                key: Key(register ? 'register-link' : 'login-link'),
                onTap: () {
                  final notifier = ref.read(authControllerProvider.notifier);
                  if (register) {
                    notifier.useRegister();
                  } else {
                    notifier.useLogin();
                  }
                },
                child: Text(
                  action,
                  style: AppTypography.body.copyWith(color: AppColors.pink),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
