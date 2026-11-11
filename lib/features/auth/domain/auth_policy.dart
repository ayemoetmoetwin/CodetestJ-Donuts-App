abstract final class AuthPolicy {
  static const fakeLatency = Duration(seconds: 1);
}

abstract final class OtpPolicy {
  static const length = 6;
  static const fakeCode = '123456';
  static const maxAttempts = 3;
  static const resendAfter = Duration(minutes: 5);
}

abstract final class AgePolicy {
  static const minimumYears = 13;
}

abstract final class NamePolicy {
  static const maxLength = 50;
}

abstract final class RegisterProgress {
  static const phone = 0.25;
  static const otp = 0.5;
  static const name = 0.75;
  static const dob = 1.0;
}
