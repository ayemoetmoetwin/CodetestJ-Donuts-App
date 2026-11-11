import 'package:jdonuts_app/features/auth/domain/auth_policy.dart';

const monthNames = <String>[
  'january',
  'february',
  'march',
  'april',
  'may',
  'june',
  'july',
  'august',
  'september',
  'october',
  'november',
  'december',
];

class BirthDate {
  const BirthDate(this.date);

  final DateTime date;
}

int? parseMonth(String input) {
  final trimmed = input.trim().toLowerCase();
  if (trimmed.isEmpty) {
    return null;
  }
  final numeric = int.tryParse(trimmed);
  if (numeric != null) {
    return numeric;
  }
  final index = monthNames.indexWhere(
    (name) => name.startsWith(trimmed) && trimmed.length >= 3,
  );
  if (index < 0) {
    return null;
  }
  return index + 1;
}

String? validateDob({
  required String month,
  required String day,
  required String year,
  required DateTime today,
}) {
  return parseDob(month: month, day: day, year: year, today: today).error;
}

DobParse parseDob({
  required String month,
  required String day,
  required String year,
  required DateTime today,
}) {
  final monthNumber = parseMonth(month);
  final dayNumber = int.tryParse(day.trim());
  final yearNumber = int.tryParse(year.trim());
  if (monthNumber == null || dayNumber == null || yearNumber == null) {
    return const DobParse.invalid('dobRequired');
  }
  if (monthNumber < 1 || monthNumber > 12 || yearNumber < 1900) {
    return const DobParse.invalid('notReal');
  }
  final days = DateTime(yearNumber, monthNumber + 1, 0).day;
  if (dayNumber < 1 || dayNumber > days) {
    return const DobParse.invalid('notReal');
  }
  final date = DateTime(yearNumber, monthNumber, dayNumber);
  final cleanToday = DateTime(today.year, today.month, today.day);
  if (date.isAfter(cleanToday)) {
    return const DobParse.invalid('future');
  }
  if (_age(date, cleanToday) < AgePolicy.minimumYears) {
    return const DobParse.invalid('tooYoung');
  }
  return DobParse.valid(date);
}

int _age(DateTime birth, DateTime today) {
  var age = today.year - birth.year;
  final beforeBirthday =
      today.month < birth.month ||
      (today.month == birth.month && today.day < birth.day);
  if (beforeBirthday) {
    age -= 1;
  }
  return age;
}

class DobParse {
  const DobParse.valid(this.date) : error = null;
  const DobParse.invalid(this.error) : date = null;

  final DateTime? date;
  final String? error;
}
