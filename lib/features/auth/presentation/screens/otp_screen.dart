import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdonuts_app/core/database/database_provider.dart';
import 'package:jdonuts_app/core/motion/motion.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/features/auth/domain/auth_policy.dart';
import 'package:jdonuts_app/features/auth/domain/validators/phone_validator.dart';
import 'package:jdonuts_app/features/auth/presentation/auth_controller.dart';
import 'package:jdonuts_app/features/auth/presentation/auth_navigation.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/otp_boxes.dart';
import 'package:jdonuts_app/l10n/generated/app_localizations.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({super.key});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  Timer? _ticker;
  final _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (underTest) {
      return;
    }
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(authControllerProvider);
    final phone = parsePhone(state.phone)?.e164 ?? '';
    ref.listen(authControllerProvider, (previous, next) {
      if (next.otp.isEmpty && _otpController.text.isNotEmpty) {
        _otpController.clear();
      }
    });
    return AuthScaffold(
      title: l10n.verifyTitle,
      progress: RegisterProgress.otp,
      body: ListView(
        children: [
          _SentLine(phone: phone),
          const SizedBox(height: AppSpacing.lg),
          Shake(
            turns: state.shake,
            child: OtpBoxes(
              controller: _otpController,
              locked: state.otpLocked || state.submitting,
              onChanged: (value) {
                final notifier = ref.read(authControllerProvider.notifier);
                notifier.setOtp(value);
                if (value.length == OtpPolicy.length) {
                  followAuth(context, notifier.submitOtp());
                }
              },
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          if (state.otpError)
            Text(
              state.otpLocked ? l10n.otpLocked : l10n.otpWrong,
              style: AppTypography.body.copyWith(color: AppColors.danger),
            ),
          const SizedBox(height: AppSpacing.sm),
          _ResendLine(deadline: state.resendAt, submitting: state.submitting),
        ],
      ),
    );
  }
}

class _SentLine extends StatelessWidget {
  const _SentLine({required this.phone});

  final String phone;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final sentence = l10n.otpSent(phone);
    final index = phone.isEmpty ? -1 : sentence.indexOf(phone);
    final base = AppTypography.body.copyWith(color: AppColors.ink);
    if (index < 0) {
      return Text(sentence, style: base);
    }
    return Text.rich(
      TextSpan(
        style: base,
        children: [
          TextSpan(text: sentence.substring(0, index)),
          TextSpan(
            text: phone,
            style: base.copyWith(fontWeight: FontWeight.w800),
          ),
          TextSpan(text: sentence.substring(index + phone.length)),
        ],
      ),
    );
  }
}

class _ResendLine extends ConsumerWidget {
  const _ResendLine({required this.deadline, required this.submitting});

  final DateTime? deadline;
  final bool submitting;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final now = ref.read(clockProvider)();
    final remaining = deadline?.difference(now) ?? Duration.zero;
    if (remaining > Duration.zero) {
      final time = _clock(remaining);
      final muted = AppTypography.body.copyWith(color: AppColors.textMuted);
      return Text.rich(
        TextSpan(
          text: '${l10n.didntReceive.trim()}\n',
          style: muted,
          children: _highlightTime(l10n.resendIn(time), time, muted),
        ),
      );
    }
    return TextButton(
      onPressed: submitting
          ? null
          : () => ref.read(authControllerProvider.notifier).resend(),
      child: Text(
        l10n.resend,
        style: AppTypography.body.copyWith(color: AppColors.pink),
      ),
    );
  }

  List<InlineSpan> _highlightTime(
    String sentence,
    String time,
    TextStyle base,
  ) {
    final index = sentence.indexOf(time);
    if (index < 0) {
      return [TextSpan(text: sentence)];
    }
    return [
      TextSpan(text: sentence.substring(0, index)),
      TextSpan(
        text: time,
        style: base.copyWith(color: AppColors.pink),
      ),
      TextSpan(text: sentence.substring(index + time.length)),
    ];
  }

  String _clock(Duration remaining) {
    final minutes = remaining.inMinutes.remainder(60);
    final seconds = remaining.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
