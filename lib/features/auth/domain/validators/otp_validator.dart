import 'package:jdonuts_app/features/auth/domain/auth_policy.dart';

bool otpHasLength(String code) => code.length == OtpPolicy.length;

bool otpIsCorrect(String code) => code == OtpPolicy.fakeCode;
