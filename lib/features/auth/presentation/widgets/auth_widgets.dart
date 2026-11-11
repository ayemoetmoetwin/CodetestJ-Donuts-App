import 'package:flutter/material.dart';
import 'package:jdonuts_app/core/motion/motion.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/l10n/generated/app_localizations.dart';

String tierName(AppLocalizations l10n, String tier) {
  return switch (tier) {
    'bronze' => l10n.bronze,
    'silver' => l10n.silver,
    'gold' => l10n.gold,
    'platinum' => l10n.platinum,
    _ => tier,
  };
}

String fieldMessage(AppLocalizations l10n, String? code) {
  return switch (code) {
    'invalid' => l10n.phoneInvalid,
    'required' => l10n.nameRequired,
    'tooLong' => l10n.nameTooLong,
    'invalidChars' => l10n.nameInvalid,
    'dobRequired' => l10n.dobRequired,
    'notReal' => l10n.dobNotReal,
    'future' => l10n.dobFuture,
    'tooYoung' => l10n.dobTooYoung,
    _ => '',
  };
}

const _comingSoonVisible = Duration(seconds: 4);

void showComingSoon(BuildContext context) {
  final messenger = ScaffoldMessenger.of(context);
  messenger.clearSnackBars();
  messenger.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: AppColors.surface,
      showCloseIcon: true,
      closeIconColor: AppColors.text,
      duration: _comingSoonVisible,
      margin: const EdgeInsets.all(AppSpacing.md),
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.sm,
        AppSpacing.sm,
        AppSpacing.xs,
        AppSpacing.sm,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radius),
        side: const BorderSide(color: AppColors.line),
      ),
      content: const _ComingSoonMessage(),
    ),
  );
}

class _ComingSoonMessage extends StatelessWidget {
  const _ComingSoonMessage();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.pinkSoft,
            shape: BoxShape.circle,
          ),
          child: SizedBox(
            width: AppSpacing.xl,
            height: AppSpacing.xl,
            child: Icon(
              Icons.schedule_rounded,
              color: AppColors.pink,
              size: AppSpacing.block,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            AppLocalizations.of(context).comingSoon,
            style: AppTypography.label,
          ),
        ),
      ],
    );
  }
}

class Shake extends StatefulWidget {
  const Shake({required this.turns, required this.child, super.key});

  final int turns;
  final Widget child;

  @override
  State<Shake> createState() => _ShakeState();
}

class _ShakeState extends State<Shake> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Motion.fast,
  );

  @override
  void didUpdateWidget(Shake oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.turns != oldWidget.turns && motionAllowed(context)) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final offset =
            (_controller.value < 0.5
                ? _controller.value
                : 1 - _controller.value) *
            12 *
            ((_controller.value * 8).round().isEven ? 1 : -1);
        return Transform.translate(offset: Offset(offset, 0), child: child);
      },
      child: widget.child,
    );
  }
}
