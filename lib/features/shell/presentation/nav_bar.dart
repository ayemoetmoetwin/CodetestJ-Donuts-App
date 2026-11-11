part of 'app_shell.dart';

class _NavBar extends StatelessWidget {
  const _NavBar({required this.index, required this.onTap});

  final int index;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    const slots = <_Slot>[
      _Slot(branch: 0, kind: _SlotKind.home),
      _Slot(branch: 2, kind: _SlotKind.reward),
      _Slot(branch: 1, kind: _SlotKind.order),
      _Slot(branch: 4, kind: _SlotKind.settings),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppSpacing.pill),
        ),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.navSky,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppSpacing.pill),
            ),
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              height:
                  AppSpacing.navHeight *
                  MediaQuery.textScalerOf(context).scale(1),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final visual = slots.indexWhere(
                    (slot) => slot.branch == index,
                  );
                  final selected = visual < 0 ? null : slots[visual];
                  final slotWidth = constraints.maxWidth / slots.length;
                  final scale = MediaQuery.textScalerOf(context).scale(1);
                  final label = selected == null
                      ? ''
                      : _label(l10n, selected.kind);
                  final showPill = label.isNotEmpty;
                  final edge = AppSpacing.xs * scale;
                  final widest = constraints.maxWidth - edge * 2;
                  final labelPainter = TextPainter(
                    text: TextSpan(
                      text: label,
                      style: AppTypography.small.copyWith(
                        color: AppColors.surface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    maxLines: 1,
                    textDirection: TextDirection.ltr,
                    textScaler: MediaQuery.textScalerOf(context),
                  )..layout();
                  const iconSize = 26.0;
                  final innerGap = showPill ? AppSpacing.xxs : 0.0;
                  var pillWidth =
                      labelPainter.width + iconSize + innerGap + edge * 2;
                  labelPainter.dispose();
                  if (pillWidth > widest) pillWidth = widest;
                  final rawLeft = selected == null
                      ? edge
                      : visual * slotWidth + (slotWidth - pillWidth) / 2;
                  final maxLeft = constraints.maxWidth - pillWidth - edge;
                  final left = rawLeft < edge
                      ? edge
                      : (rawLeft > maxLeft ? maxLeft : rawLeft);
                  final pillHeight = AppSpacing.navPillHeight * scale;
                  final top = (constraints.maxHeight - pillHeight) / 2;
                  return Stack(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Row(
                        children: [
                          for (final slot in slots)
                            Expanded(
                              child: _NavItem(
                                slot: slot,
                                hidden: index == slot.branch && showPill,
                                onTap: () => onTap(slot.branch),
                              ),
                            ),
                        ],
                      ),
                      AnimatedPositioned(
                        duration: motionOf(context, Motion.medium),
                        curve: Motion.standard,
                        left: left,
                        width: pillWidth,
                        top: top < edge ? edge : top,
                        height: pillHeight,
                        child: IgnorePointer(
                          child: AnimatedOpacity(
                            duration: motionOf(context, Motion.fast),
                            opacity: showPill ? 1 : 0,
                            child: _FloatingPill(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.pink,
                                  borderRadius: BorderRadius.circular(
                                    AppSpacing.pill,
                                  ),
                                  border: Border.all(
                                    color: AppColors.surface,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _NavIcon(
                                      kind: selected?.kind ?? _SlotKind.home,
                                      color: AppColors.surface,
                                    ),
                                    if (showPill) ...[
                                      const SizedBox(width: AppSpacing.xxs),
                                      Flexible(
                                        child: Text(
                                          label,
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                          softWrap: false,
                                          style: AppTypography.small.copyWith(
                                            color: AppColors.surface,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
