part of 'dob_wheels.dart';

class _Heading extends StatelessWidget {
  const _Heading(this.text, {required this.flex});

  final String text;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(text, textAlign: TextAlign.center, style: AppTypography.body),
    );
  }
}

class _SelectionBand extends StatelessWidget {
  const _SelectionBand();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.pinkSoft,
          borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
        ),
        child: const SizedBox(height: _itemExtent),
      ),
    );
  }
}

class _Wheel extends StatelessWidget {
  const _Wheel({
    required this.controller,
    required this.count,
    required this.selected,
    required this.label,
    required this.onChanged,
    this.flex = 1,
    super.key,
  });

  final FixedExtentScrollController controller;
  final int count;
  final int selected;
  final int flex;
  final String Function(int index) label;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: _itemExtent,
        physics: const FixedExtentScrollPhysics(),
        diameterRatio: 1.5,
        perspective: 0.003,
        overAndUnderCenterOpacity: 0.45,
        onSelectedItemChanged: onChanged,
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: count,
          builder: (context, index) {
            final selected = index == this.selected;
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    label(index),
                    style:
                        (selected
                                ? AppTypography.section
                                : AppTypography.cardTitle)
                            .copyWith(
                              color: selected ? AppColors.pink : AppColors.text,
                              fontWeight: selected
                                  ? FontWeight.w800
                                  : FontWeight.w500,
                            ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DobPickerSheet extends StatefulWidget {
  const DobPickerSheet({super.key});

  @override
  State<DobPickerSheet> createState() => _DobPickerSheetState();
}

class _DobPickerSheetState extends State<DobPickerSheet> {
  final _wheels = GlobalKey<DobWheelsState>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.sm,
          AppSpacing.lg,
          AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _Grabber(),
            const SizedBox(height: AppSpacing.md),
            DobWheels(key: _wheels),
            const SizedBox(height: AppSpacing.lg),
            AppButton(
              key: const Key('dob-done'),
              label: l10n.chooseDate,
              onPressed: () {
                _wheels.currentState?.commit();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Grabber extends StatelessWidget {
  const _Grabber();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.line,
        borderRadius: BorderRadius.circular(AppSpacing.pill),
      ),
      child: const SizedBox(width: 40, height: 4),
    );
  }
}
