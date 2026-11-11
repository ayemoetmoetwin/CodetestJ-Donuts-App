part of '../rewards_screen.dart';

class _StaggerIn extends StatefulWidget {
  const _StaggerIn({
    required this.play,
    required this.index,
    required this.fade,
    required this.child,
    super.key,
  });

  final bool play;
  final int index;
  final bool fade;
  final Widget child;

  @override
  State<_StaggerIn> createState() => _StaggerInState();
}

class _StaggerInState extends State<_StaggerIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Motion.medium,
  );
  var _curve = const Interval(0, 1, curve: Motion.standard);
  var _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _kick();
  }

  @override
  void didUpdateWidget(covariant _StaggerIn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.play && !oldWidget.play) {
      _started = false;
      _kick();
    }
  }

  void _kick() {
    if (!widget.play || _started) {
      return;
    }
    _started = true;
    if (!motionAllowed(context)) {
      _controller.value = 1;
      return;
    }
    final delay = widget.index * Motion.stagger.inMilliseconds;
    final total = Motion.medium.inMilliseconds + delay;
    _controller.duration = Duration(milliseconds: total);
    _curve = Interval(delay / total, 1, curve: Motion.standard);
    _controller.forward();
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
      child: widget.child,
      builder: (context, child) {
        final t = _curve.transform(_controller.value.clamp(0, 1).toDouble());
        final travel = widget.fade ? 16.0 : 8.0;
        return Opacity(
          opacity: widget.fade ? t : 1.0,
          child: Transform.translate(
            offset: Offset(0, (1 - t) * travel),
            child: child,
          ),
        );
      },
    );
  }
}

class _ChallengeCard extends StatelessWidget {
  const _ChallengeCard({
    required this.challenge,
    required this.reveal,
    required this.onEarn,
  });

  final Challenge challenge;
  final bool reveal;
  final VoidCallback onEarn;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.chip),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          _Art(challenge: challenge, reveal: reveal),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  challenge.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.cardTitle,
                ),
                const SizedBox(height: AppSpacing.hairline),
                Text(
                  '${challenge.progress}/${challenge.goal}',
                  style: AppTypography.body,
                ),
                const SizedBox(height: 8),
                _EarnCluster(
                  active: challenge.canClaim,
                  label: challenge.isClaimed ? l10n.collected : l10n.earn,
                  pointsLabel: l10n.pointsShort(challenge.rewardPoints),
                  rewardPoints: challenge.rewardPoints,
                  onPressed: challenge.canClaim ? onEarn : () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
