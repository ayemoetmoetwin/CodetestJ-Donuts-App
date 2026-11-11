part of '../rewards_screen.dart';

class _EarnGlow extends StatelessWidget {
  const _EarnGlow({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final t = animation.value;
        if (t <= 0 || t >= 1) {
          return const SizedBox.shrink();
        }
        return IgnorePointer(
          child: Transform.scale(
            scale: 1 + (t * 0.9),
            child: Opacity(
              opacity: (1 - t) * 0.4,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.cyan,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppSpacing.pill),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _RisingPoints extends StatefulWidget {
  const _RisingPoints({required this.label, super.key});

  final String label;

  @override
  State<_RisingPoints> createState() => _RisingPointsState();
}

class _RisingPointsState extends State<_RisingPoints>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Motion.slow,
  )..forward();

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
        final t = Curves.easeOutCubic.transform(_controller.value);
        final fade = t < 0.4 ? 1.0 : (1 - ((t - 0.4) / 0.6));
        final scale = t < 0.22
            ? 0.6 + (t / 0.22) * 0.5
            : 1.1 - ((t - 0.22) * 0.12);
        return Opacity(
          opacity: fade.clamp(0, 1),
          child: Transform.translate(
            offset: Offset(0, -46 * t),
            child: Transform.scale(
              scale: scale.clamp(0.6, 1.15).toDouble(),
              child: child,
            ),
          ),
        );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.cyan,
          borderRadius: BorderRadius.circular(AppSpacing.pill),
          boxShadow: [
            BoxShadow(
              color: AppColors.cyan.withValues(alpha: 0.35),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xs,
            vertical: AppSpacing.xxs,
          ),
          child: Text(
            widget.label,
            style: AppTypography.small.copyWith(
              color: AppColors.surface,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
