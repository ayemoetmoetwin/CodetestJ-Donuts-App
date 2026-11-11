part of '../rewards_screen.dart';

class _EarnCluster extends StatefulWidget {
  const _EarnCluster({
    required this.active,
    required this.label,
    required this.pointsLabel,
    required this.rewardPoints,
    required this.onPressed,
  });

  final bool active;
  final String label;
  final String pointsLabel;
  final int rewardPoints;
  final VoidCallback onPressed;

  @override
  State<_EarnCluster> createState() => _EarnClusterState();
}

class _EarnClusterState extends State<_EarnCluster> {
  var _burst = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: AppSpacing.sm,
      children: [
        _EarnButton(
          active: widget.active,
          label: widget.label,
          rewardPoints: widget.rewardPoints,
          burst: _burst,
          onPressed: () {
            if (widget.active) {
              setState(() => _burst++);
            }
            widget.onPressed();
          },
        ),
        if (widget.rewardPoints > 0)
          _PointsPop(label: widget.pointsLabel, burst: _burst),
      ],
    );
  }
}

class _PointsPop extends StatelessWidget {
  const _PointsPop({required this.label, required this.burst});

  final String label;
  final int burst;

  @override
  Widget build(BuildContext context) {
    final play = burst > 0 && motionAllowed(context);
    return TweenAnimationBuilder<double>(
      key: ValueKey(burst),
      tween: Tween(begin: play ? 0.55 : 1, end: 1),
      duration: motionOf(context, Motion.fast),
      curve: Motion.overshoot,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          alignment: Alignment.centerLeft,
          child: child,
        );
      },
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTypography.caption.copyWith(color: AppColors.text),
      ),
    );
  }
}

class _EarnButton extends StatefulWidget {
  const _EarnButton({
    required this.active,
    required this.label,
    required this.rewardPoints,
    required this.burst,
    required this.onPressed,
  });

  final bool active;
  final String label;
  final int rewardPoints;
  final int burst;
  final VoidCallback onPressed;

  @override
  State<_EarnButton> createState() => _EarnButtonState();
}

class _EarnButtonState extends State<_EarnButton>
    with TickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: Motion.slow,
  );
  late final AnimationController _pop = AnimationController(
    vsync: this,
    duration: Motion.medium,
  );
  late final Animation<double> _popScale = TweenSequence<double>([
    TweenSequenceItem(
      tween: Tween<double>(
        begin: 1,
        end: 0.9,
      ).chain(CurveTween(curve: Curves.easeOut)),
      weight: 28,
    ),
    TweenSequenceItem(
      tween: Tween<double>(
        begin: 0.9,
        end: 1.12,
      ).chain(CurveTween(curve: Curves.easeOut)),
      weight: 40,
    ),
    TweenSequenceItem(
      tween: Tween<double>(
        begin: 1.12,
        end: 1,
      ).chain(CurveTween(curve: Curves.easeInOut)),
      weight: 32,
    ),
  ]).animate(_pop);
  var _showCheck = false;
  var _popToken = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncPulse();
  }

  @override
  void didUpdateWidget(covariant _EarnButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.burst != oldWidget.burst && widget.burst > 0) {
      _celebrate();
    }
    _syncPulse();
  }

  void _syncPulse() {
    final play =
        widget.active &&
        motionAllowed(context) &&
        !_pop.isAnimating &&
        !_showCheck;
    if (play && !_pulse.isAnimating) {
      _pulse.repeat(reverse: true);
    } else if (!play && _pulse.isAnimating) {
      _pulse.stop();
      _pulse.value = 0;
    }
  }

  void _celebrate() {
    if (!widget.active || !motionAllowed(context)) {
      return;
    }
    final token = ++_popToken;
    _pulse.stop();
    _pulse.value = 0;
    _showCheck = true;
    _pop.forward(from: 0).whenComplete(() {
      if (!mounted || token != _popToken) {
        return;
      }
      setState(() => _showCheck = false);
      _syncPulse();
    });
  }

  @override
  void dispose() {
    _pulse.dispose();
    _pop.dispose();
    super.dispose();
  }

  double get _scale {
    if (_pop.isAnimating) {
      return _popScale.value;
    }
    if (_pulse.isAnimating) {
      return 1 + (_pulse.value * 0.05);
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final showFloat =
        widget.burst > 0 && widget.rewardPoints > 0 && motionAllowed(context);
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: Listenable.merge([_pulse, _pop]),
          builder: (context, child) {
            return Transform.scale(scale: _scale, child: child);
          },
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(child: _EarnGlow(animation: _pop)),
              Pressable(
                onPressed: widget.onPressed,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.cardPad,
                    vertical: AppSpacing.inset,
                  ),
                  decoration: BoxDecoration(
                    color: widget.active ? AppColors.cyan : AppColors.earnIdle,
                    borderRadius: BorderRadius.circular(AppSpacing.pill),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(
                        opacity: 0,
                        child: Text(widget.label, style: _labelStyle),
                      ),
                      AnimatedSwitcher(
                        duration: motionOf(context, Motion.fast),
                        switchInCurve: Motion.overshoot,
                        switchOutCurve: Motion.standard,
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                        child: _showCheck
                            ? const Icon(
                                Icons.check_rounded,
                                key: ValueKey('earned'),
                                color: AppColors.surface,
                                size: 18,
                              )
                            : Text(
                                widget.label,
                                key: const ValueKey('earn'),
                                style: _labelStyle,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (showFloat)
          Positioned(
            top: -6,
            child: IgnorePointer(
              child: _RisingPoints(
                key: ValueKey(widget.burst),
                label: '+${widget.rewardPoints}',
              ),
            ),
          ),
      ],
    );
  }

  TextStyle get _labelStyle {
    return AppTypography.caption.copyWith(
      color: AppColors.surface,
      fontWeight: FontWeight.w800,
    );
  }
}
