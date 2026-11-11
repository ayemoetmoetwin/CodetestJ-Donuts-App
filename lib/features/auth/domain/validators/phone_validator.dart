import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_validator.freezed.dart';
part 'phone_validator.g.dart';

@freezed
abstract class PhoneNumber with _$PhoneNumber {
  const factory PhoneNumber({required String national, required String e164}) =
      _PhoneNumber;

  factory PhoneNumber.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberFromJson(json);
}

PhoneNumber? parsePhone(String input) {
  var value = input.replaceAll(RegExp(r'[\s-]'), '');
  if (value.startsWith('+95')) {
    value = value.substring(3);
  }
  if (value.startsWith('0')) {
    value = value.substring(1);
  }
  if (!RegExp(r'^9\d{7,9}$').hasMatch(value)) {
    return null;
  }
  return PhoneNumber(national: value, e164: '+95$value');
}

String? validatePhone(String input) {
  if (parsePhone(input) == null) {
    return 'invalid';
  }
  return null;
}
