import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdonuts_app/core/database/database_provider.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/core/widgets/app_button.dart';
import 'package:jdonuts_app/features/auth/domain/validators/dob_validator.dart';
import 'package:jdonuts_app/features/auth/presentation/auth_controller.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:jdonuts_app/l10n/generated/app_localizations.dart';
part 'dob_wheel_column.dart';

const _monthLabels = <String>[
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

const _firstYear = 1900;
const _itemExtent = 44.0;

String monthWheelLabel(int month) => _monthLabels[month - 1];

class DobWheels extends ConsumerStatefulWidget {
  const DobWheels({super.key});

  @override
  ConsumerState<DobWheels> createState() => DobWheelsState();
}

class DobWheelsState extends ConsumerState<DobWheels> {
  late final FixedExtentScrollController _month;
  late final FixedExtentScrollController _day;
  late final FixedExtentScrollController _year;
  late int _monthIndex;
  late int _dayIndex;
  late int _yearIndex;

  int get _initialMonth {
    final parsed = parseMonth(ref.read(authControllerProvider).month);
    return (parsed ?? 1) - 1;
  }

  int get _initialDay {
    final parsed = int.tryParse(ref.read(authControllerProvider).day.trim());
    return ((parsed ?? 1) - 1).clamp(0, 30);
  }

  int get _initialYear {
    final today = ref.read(clockProvider)();
    final parsed = int.tryParse(ref.read(authControllerProvider).year.trim());
    final year = parsed ?? 2000;
    return (year - _firstYear).clamp(0, today.year - _firstYear);
  }

  @override
  void initState() {
    super.initState();
    _monthIndex = _initialMonth;
    _dayIndex = _initialDay;
    _yearIndex = _initialYear;
    _month = FixedExtentScrollController(initialItem: _monthIndex);
    _day = FixedExtentScrollController(initialItem: _dayIndex);
    _year = FixedExtentScrollController(initialItem: _yearIndex);
  }

  @override
  void dispose() {
    _month.dispose();
    _day.dispose();
    _year.dispose();
    super.dispose();
  }

  void choose({required int month, required int day, required int year}) {
    final today = ref.read(clockProvider)();
    _yearIndex = (year - _firstYear).clamp(0, today.year - _firstYear);
    _monthIndex = (month - 1).clamp(0, 11);
    final days = DateTime(_yearIndex + _firstYear, _monthIndex + 2, 0).day;
    _dayIndex = (day - 1).clamp(0, days - 1);
    if (_year.hasClients) {
      _year.jumpToItem(_yearIndex);
    }
    if (_month.hasClients) {
      _month.jumpToItem(_monthIndex);
    }
    if (_day.hasClients) {
      _day.jumpToItem(_dayIndex);
    }
    setState(() {});
  }

  void commit() => _publish();

  int _dayCount() {
    final year = _firstYear + _yearIndex;
    final month = _monthIndex + 1;
    return DateTime(year, month + 1, 0).day;
  }

  void _onMonth(int index) {
    _monthIndex = index;
    _fitDay();
    _publish();
  }

  void _onDay(int index) {
    _dayIndex = index;
    _publish();
  }

  void _onYear(int index) {
    _yearIndex = index;
    _fitDay();
    _publish();
  }

  void _fitDay() {
    final lastDay = _dayCount() - 1;
    if (_dayIndex > lastDay) {
      _dayIndex = lastDay;
      if (_day.hasClients) {
        _day.jumpToItem(lastDay);
      }
    }
  }

  void _publish() {
    final day = (_dayIndex + 1).clamp(1, _dayCount());
    ref
        .read(authControllerProvider.notifier)
        .setBirthDate(
          month: '${_monthIndex + 1}',
          day: '$day',
          year: '${_firstYear + _yearIndex}',
        );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final days = _dayCount();
    final day = (_dayIndex + 1).clamp(1, days);
    final latestYear = ref.watch(clockProvider)().year;
    final message = fieldMessage(
      l10n,
      validateDob(
        month: '${_monthIndex + 1}',
        day: '$day',
        year: '${_firstYear + _yearIndex}',
        today: ref.watch(clockProvider)(),
      ),
    );
    return Column(
      children: [
        Text(
          '${_monthLabels[_monthIndex]} $day, ${_firstYear + _yearIndex}',
          style: AppTypography.section.copyWith(
            color: AppColors.pink,
            fontWeight: FontWeight.w800,
          ),
        ),
        if (message.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppTypography.body.copyWith(color: AppColors.danger),
          ),
        ],
        const SizedBox(height: AppSpacing.md),
        Row(
          children: [
            _Heading(l10n.monthHint, flex: 5),
            _Heading(l10n.dayHint, flex: 3),
            _Heading(l10n.yearHint, flex: 4),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
            border: Border.all(color: AppColors.line),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
            child: SizedBox(
              height: 220,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const _SelectionBand(),
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.transparent,
                          AppColors.scrim,
                          AppColors.scrim,
                          AppColors.transparent,
                        ],
                        stops: [0, 0.22, 0.78, 1],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.dstIn,
                    child: Row(
                      children: [
                        _Wheel(
                          key: const Key('dob-wheel-month'),
                          controller: _month,
                          count: _monthLabels.length,
                          selected: _monthIndex,
                          flex: 5,
                          label: (index) => _monthLabels[index],
                          onChanged: _onMonth,
                        ),
                        _Wheel(
                          key: const Key('dob-wheel-day'),
                          controller: _day,
                          count: days,
                          selected: _dayIndex,
                          flex: 3,
                          label: (index) => '${index + 1}',
                          onChanged: _onDay,
                        ),
                        _Wheel(
                          key: const Key('dob-wheel-year'),
                          controller: _year,
                          count: latestYear - _firstYear + 1,
                          selected: _yearIndex,
                          flex: 4,
                          label: (index) => '${_firstYear + index}',
                          onChanged: _onYear,
                        ),
                      ],
                    ),
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
