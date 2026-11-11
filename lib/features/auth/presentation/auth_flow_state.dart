import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jdonuts_app/features/auth/domain/usecases/start_phone_auth.dart';
import 'package:jdonuts_app/features/auth/domain/validators/dob_validator.dart';
import 'package:jdonuts_app/features/auth/domain/validators/name_validator.dart';
import 'package:jdonuts_app/features/auth/domain/validators/phone_validator.dart';

part 'auth_flow_state.freezed.dart';
part 'auth_flow_state.g.dart';

enum AuthBanner { none, notRegistered, alreadyRegistered }

@freezed
abstract class AuthFlowState with _$AuthFlowState {
  const AuthFlowState._();

  const factory AuthFlowState({
    @Default(AuthMode.register) AuthMode mode,
    @Default('') String phone,
    @Default(false) bool phoneTouched,
    @Default(AuthBanner.none) AuthBanner banner,
    @Default('') String otp,
    @Default(0) int otpFailures,
    @Default(false) bool otpLocked,
    @Default(false) bool otpError,
    @Default(0) int shake,
    DateTime? resendAt,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default(false) bool nameTouched,
    @Default('') String month,
    @Default('') String day,
    @Default('') String year,
    @Default(false) bool dobTouched,
    @Default(false) bool submitting,
  }) = _AuthFlowState;

  factory AuthFlowState.fromJson(Map<String, dynamic> json) =>
      _$AuthFlowStateFromJson(json);

  bool get phoneReady => parsePhone(phone) != null;

  String? get phoneError => phoneTouched ? validatePhone(phone) : null;

  String? get firstNameError =>
      nameTouched ? validateFirstName(firstName) : null;

  String? get lastNameError => nameTouched ? validateLastName(lastName) : null;

  bool get nameReady =>
      validateFirstName(firstName) == null &&
      validateLastName(lastName) == null;

  String? dobError(DateTime today) {
    if (!dobTouched) {
      return null;
    }
    return validateDob(month: month, day: day, year: year, today: today);
  }

  bool dobReady(DateTime today) {
    return validateDob(month: month, day: day, year: year, today: today) ==
        null;
  }
}
