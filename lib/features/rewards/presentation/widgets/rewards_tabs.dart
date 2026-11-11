part of '../rewards_screen.dart';

class _Title extends StatelessWidget {
  const _Title({required this.badge, required this.enter});

  final int badge;
  final Animation<double> enter;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scale = Tween<double>(begin: 0.4, end: 1).animate(
      enter.drive(
        CurveTween(curve: const Interval(0, 0.55, curve: Motion.overshoot)),
      ),
    );
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: AppSpacing.block),
            child: Text(
              l10n.rewardsTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.rewardTitle,
            ),
          ),
        ),
        ScaleTransition(
          scale: scale,
          child: Container(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.chip,
              AppSpacing.tight,
              AppSpacing.sm,
              AppSpacing.tight,
            ),
            decoration: const BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(AppSpacing.pill),
              ),
              border: Border(
                left: BorderSide(color: AppColors.surface),
                top: BorderSide(color: AppColors.surface),
                bottom: BorderSide(color: AppColors.surface),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.rewardsBadge,
                  style: AppTypography.small.copyWith(
                    color: AppColors.surface,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                Container(
                  width: 22,
                  height: 22,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColors.surface,
                    shape: BoxShape.circle,
                  ),
                  child: AnimatedSwitcher(
                    duration: Motion.fast,
                    child: Text(
                      '$badge',
                      key: ValueKey(badge),
                      style: AppTypography.badgeCount,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({required this.gift, required this.onChanged});

  static const barHeight = 48.0;
  static const overlap = barHeight / 2;

  final bool gift;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SizedBox(
      height: barHeight,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _TabChip(
              label: l10n.eatMore,
              selected: !gift,
              onTap: () => onChanged(false),
            ),
            const SizedBox(width: AppSpacing.sm),
            _TabChip(
              label: l10n.giftTab,
              selected: gift,
              onTap: () => onChanged(true),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabChip extends StatefulWidget {
  const _TabChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  State<_TabChip> createState() => _TabChipState();
}

class _TabChipState extends State<_TabChip>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pop = AnimationController(
    vsync: this,
    duration: Motion.fast,
    value: 1,
  );
  late final Animation<double> _scale = TweenSequence<double>([
    TweenSequenceItem(
      tween: Tween<double>(
        begin: 0.94,
        end: 1.06,
      ).chain(CurveTween(curve: Curves.easeOut)),
      weight: 55,
    ),
    TweenSequenceItem(
      tween: Tween<double>(
        begin: 1.06,
        end: 1,
      ).chain(CurveTween(curve: Curves.easeInOut)),
      weight: 45,
    ),
  ]).animate(_pop);

  @override
  void didUpdateWidget(covariant _TabChip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selected && !oldWidget.selected && motionAllowed(context)) {
      _pop.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _pop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selected = widget.selected;
    return ScaleTransition(
      scale: _scale,
      child: Pressable(
        onPressed: widget.onTap,
        child: AnimatedContainer(
          duration: motionOf(context, Motion.fast),
          curve: Motion.standard,
          height: _Tabs.barHeight,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.block),
          decoration: BoxDecoration(
            color: selected ? AppColors.cyan : AppColors.tabIdle,
            borderRadius: BorderRadius.circular(AppSpacing.pill),
            border: Border.all(color: AppColors.surface, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.ink.withValues(alpha: selected ? 0.12 : 0.07),
                blurRadius: selected ? 14 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            widget.label,
            maxLines: 1,
            softWrap: false,
            style: AppTypography.label.copyWith(
              fontWeight: FontWeight.w800,
              height: 1,
              color: selected ? AppColors.surface : AppColors.ink,
            ),
          ),
        ),
      ),
    );
  }
}
