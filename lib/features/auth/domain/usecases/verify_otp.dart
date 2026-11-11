import 'package:jdonuts_app/features/auth/domain/auth_policy.dart';
import 'package:jdonuts_app/features/auth/domain/validators/otp_validator.dart';

sealed class OtpVerdict {
  const OtpVerdict();
}

class OtpAccepted extends OtpVerdict {
  const OtpAccepted();
}

class OtpRejected extends OtpVerdict {
  const OtpRejected(this.failures);

  final int failures;
}

class OtpLocked extends OtpVerdict {
  const OtpLocked(this.failures);

  final int failures;
}

class VerifyOtp {
  const VerifyOtp();

  OtpVerdict call({
    required String code,
    required int previousFailures,
    required bool locked,
  }) {
    if (locked) {
      return OtpLocked(previousFailures);
    }
    if (!otpIsCorrect(code)) {
      final failures = previousFailures + 1;
      if (failures >= OtpPolicy.maxAttempts) {
        return OtpLocked(failures);
      }
      return OtpRejected(failures);
    }
    return const OtpAccepted();
  }
}
