part of '../rewards_screen.dart';

class _Body extends StatelessWidget {
  const _Body({
    required this.snapshot,
    required this.countFrom,
    required this.gift,
    required this.toGift,
    required this.crossfade,
    required this.generation,
    required this.cardToken,
    required this.enter,
    required this.onTab,
    required this.onEarn,
  });

  final RewardsSnapshot snapshot;
  final int countFrom;
  final bool gift;
  final bool toGift;
  final bool crossfade;
  final int generation;
  final int cardToken;
  final Animation<double> enter;
  final ValueChanged<bool> onTab;
  final ValueChanged<Challenge> onEarn;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final shown = snapshot.challenges
        .where((item) => item.tab == (gift ? 'gift' : 'earn'))
        .toList();
    final next = tierName(l10n, snapshot.nextTier);
    final played = generation > 0;
    final top = MediaQuery.paddingOf(context).top;
    return ListView(
      padding: const EdgeInsets.only(bottom: AppSpacing.scrollTail),
      children: [
        ColoredBox(
          color: AppColors.surface,
          child: Column(
            children: [
              SizedBox(height: top + AppSpacing.xl),
              _Title(badge: snapshot.rewardsBadge, enter: enter),
              const SizedBox(height: AppSpacing.block),
              Padding(
                padding: const EdgeInsets.only(left: AppSpacing.block),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final ring = constraints.maxWidth * 0.7 - 10;
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TierTrack(
                            labels: [l10n.silver, l10n.gold, l10n.platinum],
                            current: snapshot.tier,
                            next: snapshot.nextTier,
                            points: snapshot.points,
                            progress: snapshot.tierProgress,
                            animate: played,
                            enter: enter,
                            currentCaption: l10n.youAreHere,
                            nextCaption: l10n.ptsRemaining(
                              formatPoints(snapshot.pointsToNext),
                              next,
                            ),
                            laterCaption: l10n.beHereSoon,
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(30, 0),
                          child: SizedBox(
                            width: ring,
                            height: ring,
                            child: PointsRing(
                              key: ValueKey(generation),
                              from: countFrom,
                              points: snapshot.points,
                              caption: l10n.totalPoints,
                              animate: played,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: _Tabs.overlap + AppSpacing.sm),
            ],
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -_Tabs.overlap),
          child: _Tabs(gift: gift, onChanged: onTab),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.block),
          child: _SizedSwitch(
            duration: motionOf(context, Motion.medium),
            child: AnimatedSwitcher(
              duration: motionOf(context, Motion.slow),
              switchInCurve: Curves.linear,
              switchOutCurve: Curves.linear,
              layoutBuilder: (current, previous) {
                return ClipRect(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [...previous, ?current],
                  ),
                );
              },
              transitionBuilder: (child, animation) {
                return AnimatedBuilder(
                  animation: animation,
                  child: child,
                  builder: (context, child) {
                    final appear = ((animation.value - 0.5) / 0.5).clamp(
                      0.0,
                      1.0,
                    );
                    final eased = Curves.easeOutCubic.transform(appear);
                    return IgnorePointer(
                      ignoring: appear < 1,
                      child: Opacity(
                        opacity: appear,
                        child: Transform.translate(
                          offset: Offset(
                            (toGift ? 1 : -1) * 28 * (1 - eased),
                            22 * (1 - eased),
                          ),
                          child: child,
                        ),
                      ),
                    );
                  },
                );
              },
              child: Column(
                key: ValueKey(gift),
                children: [
                  for (var index = 0; index < shown.length; index++)
                    _StaggerIn(
                      key: ValueKey('${shown[index].id}-$cardToken'),
                      play: cardToken > 0,
                      index: index,
                      fade: !crossfade,
                      child: _ChallengeCard(
                        challenge: shown[index],
                        reveal: cardToken > 0,
                        onEarn: () => onEarn(shown[index]),
                      ),
                    ),
                  if (shown.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.lg,
                      ),
                      child: Text(l10n.emptySection),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SizedSwitch extends StatelessWidget {
  const _SizedSwitch({required this.duration, required this.child});

  final Duration duration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (duration == Duration.zero) {
      return child;
    }
    return AnimatedSize(
      duration: duration,
      curve: Motion.standard,
      alignment: Alignment.topCenter,
      child: child,
    );
  }
}
