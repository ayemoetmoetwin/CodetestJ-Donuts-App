part of 'reward_painters.dart';

class TierTrack extends StatelessWidget {
  const TierTrack({
    required this.labels,
    required this.current,
    required this.next,
    required this.points,
    required this.progress,
    required this.animate,
    required this.enter,
    required this.currentCaption,
    required this.nextCaption,
    required this.laterCaption,
    super.key,
  });

  final List<String> labels;
  final String current;
  final String next;
  final int points;
  final double progress;
  final bool animate;
  final Animation<double> enter;
  final String currentCaption;
  final String nextCaption;
  final String laterCaption;

  static const _ids = ['silver', 'gold', 'platinum'];
  static const _rank = {'bronze': 0, 'silver': 1, 'gold': 2, 'platinum': 3};

  bool _reached(String id) {
    final mine = _rank[current] ?? 0;
    final step = _rank[id] ?? 1;
    if (mine >= 2 && step <= mine) {
      return true;
    }
    if (id == 'silver') {
      return points > 0 || mine >= 1;
    }
    return mine >= step;
  }

  double _segmentFill(String above, double animated) {
    if (_reached(above)) {
      return 1;
    }
    if (above == next) {
      return animated;
    }
    return 0;
  }

  String get _activeId {
    final mine = _rank[current] ?? 0;
    if (mine >= 3) {
      return 'platinum';
    }
    if (mine >= 2) {
      return 'gold';
    }
    if (points > 0) {
      return 'silver';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    if (!animate) {
      return _ladder(0);
    }
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: progress.clamp(0, 1)),
      duration: motionOf(context, Motion.ring),
      curve: Motion.standard,
      builder: (context, value, _) => _ladder(value),
    );
  }

  Widget _ladder(double fill) {
    return Column(
      children: [
        for (var index = 0; index < _ids.length; index++)
          _TierRow(
            label: labels[index],
            caption: _caption(_ids[index], index),
            badge: _badges[index],
            active: _ids[index] == _activeId,
            reached: _reached(_ids[index]),
            showLine: index < _ids.length - 1,
            fill: index < _ids.length - 1
                ? _segmentFill(_ids[index + 1], fill)
                : 0,
            enter: enter,
            index: index,
          ),
      ],
    );
  }

  String _caption(String id, int index) {
    final here = _ids.indexOf(current);
    if (index < here) {
      return '';
    }
    if (id == current) {
      return currentCaption;
    }
    if (id == next) {
      return nextCaption;
    }
    return laterCaption;
  }
}

const _badges = <_TierBadge>[
  _TierBadge('assets/images/tier_silver.png', AppColors.silverStroke),
  _TierBadge('assets/images/tier_gold.png', AppColors.goldInk),
  _TierBadge('assets/images/tier_platinum.png', AppColors.platinumInk),
];

class _TierBadge {
  const _TierBadge(this.asset, this.stroke);

  final String asset;
  final Color stroke;
}

class _TierRow extends StatelessWidget {
  const _TierRow({
    required this.label,
    required this.caption,
    required this.badge,
    required this.active,
    required this.reached,
    required this.showLine,
    required this.fill,
    required this.enter,
    required this.index,
  });

  final String label;
  final String caption;
  final _TierBadge badge;
  final bool active;
  final bool reached;
  final bool showLine;
  final double fill;
  final Animation<double> enter;
  final int index;

  @override
  Widget build(BuildContext context) {
    final start = index * 0.18;
    final curved = enter.drive(
      CurveTween(curve: Interval(start, 1, curve: Motion.standard)),
    );
    return FadeTransition(
      opacity: curved,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-0.12, 0.15),
          end: Offset.zero,
        ).animate(curved),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                _TierShield(badge: badge, active: active, reached: reached),
                if (showLine) _TierLine(fill: fill),
              ],
            ),
            const SizedBox(width: AppSpacing.inset),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: AppSpacing.tight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        label,
                        maxLines: 1,
                        softWrap: false,
                        style: AppTypography.cardTitle.copyWith(height: 1.15),
                      ),
                    ),
                    const SizedBox(height: 5),
                    _TierCaption(caption: caption),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
