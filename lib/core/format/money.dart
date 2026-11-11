import 'package:intl/intl.dart';

String formatMmk(int amount) {
  final formatted = NumberFormat('#,##0', 'en').format(amount);
  return '$formatted MMK';
}

String formatPoints(int amount) {
  return NumberFormat('#,##0', 'en').format(amount);
}
