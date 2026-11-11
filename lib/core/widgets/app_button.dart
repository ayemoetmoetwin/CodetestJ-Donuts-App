import 'package:flutter/material.dart';
import 'package:jdonuts_app/core/motion/motion.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';

class Pressable extends StatefulWidget {
  const Pressable({required this.child, this.onPressed, super.key});

  final Widget child;
  final VoidCallback? onPressed;

  @override
  State<Pressable> createState() => _PressableState();
}

class _PressableState extends State<Pressable> {
  var _down = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;
    final scale = _down && enabled && motionAllowed(context)
        ? Motion.pressScale
        : 1.0;
    return GestureDetector(
      onTapDown: enabled ? (_) => setState(() => _down = true) : null,
      onTapCancel: () => setState(() => _down = false),
      onTapUp: (_) => setState(() => _down = false),
      onTap: widget.onPressed,
      child: AnimatedScale(
        scale: scale,
        duration: motionOf(context, Motion.instant),
        curve: Motion.standard,
        child: widget.child,
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    this.onPressed,
    this.loading = false,
    this.trailing,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !loading;
    final scale = MediaQuery.textScalerOf(context).scale(1);
    return Pressable(
      onPressed: enabled ? onPressed : null,
      child: AnimatedContainer(
        duration: motionOf(context, Motion.fast),
        curve: Motion.standard,
        height: AppSpacing.buttonHeight * scale,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        decoration: BoxDecoration(
          color: enabled || loading ? AppColors.cyan : AppColors.disabled,
          borderRadius: BorderRadius.circular(AppSpacing.pill),
        ),
        child: AnimatedSwitcher(
          duration: motionOf(context, Motion.fast),
          child: loading
              ? const SizedBox(
                  key: ValueKey('loading'),
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.4,
                    color: AppColors.surface,
                  ),
                )
              : FittedBox(
                  key: const ValueKey('label'),
                  fit: BoxFit.scaleDown,
                  child: Text(
                    trailing == null ? label : '$label | $trailing',
                    maxLines: 1,
                    style: trailing == null
                        ? AppTypography.button
                        : AppTypography.button.copyWith(
                            color: AppColors.surface,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.2,
                          ),
                  ),
                ),
        ),
      ),
    );
  }
}
