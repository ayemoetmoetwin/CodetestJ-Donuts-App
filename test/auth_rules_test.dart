import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts_app/features/auth/data/auth_repository_impl.dart';
import 'package:jdonuts_app/features/auth/domain/auth_policy.dart';
import 'package:jdonuts_app/features/auth/domain/entities/app_user.dart';
import 'package:jdonuts_app/features/auth/domain/usecases/start_phone_auth.dart';
import 'package:jdonuts_app/features/auth/domain/usecases/verify_otp.dart';
import 'package:jdonuts_app/features/auth/domain/validators/dob_validator.dart';
import 'package:jdonuts_app/features/auth/domain/validators/name_validator.dart';
import 'package:jdonuts_app/features/auth/domain/validators/phone_validator.dart';

void main() {
  final today = DateTime(2026, 11, 9);

  test('normalizes a local Myanmar number to +95', () {
    expect(parsePhone('09254135592')?.e164, '+959254135592');
    expect(parsePhone('09-254-135-592')?.e164, '+959254135592');
    expect(parsePhone('9254135592')?.e164, '+959254135592');
  });

  test('rejects a phone that is not 9 plus 7 to 9 digits', () {
    expect(validatePhone('12345'), 'invalid');
    expect(validatePhone('812345678'), 'invalid');
    expect(validatePhone('009254135592'), 'invalid');
  });

  test('accepts the shortest and longest valid phones', () {
    expect(parsePhone('91234567')?.e164, '+9591234567');
    expect(parsePhone('9123456789')?.e164, '+959123456789');
    expect(parsePhone('91234567890'), isNull);
  });

  test('requires a first name of letters and spaces', () {
    expect(validateFirstName('  '), 'required');
    expect(validateFirstName('Ye Min'), isNull);
    expect(validateFirstName('ရန်နိုင်'), isNull);
    expect(validateFirstName('Ye1'), 'invalidChars');
    expect(validateFirstName('A' * 51), 'tooLong');
  });

  test('allows an empty last name and rejects digits', () {
    expect(validateLastName(''), isNull);
    expect(validateLastName('Phyo Win'), isNull);
    expect(validateLastName('Win2'), 'invalidChars');
  });

  test('rejects dates that are not on the calendar', () {
    expect(
      validateDob(month: 'April', day: '31', year: '2000', today: today),
      'notReal',
    );
    expect(
      validateDob(month: 'February', day: '29', year: '2023', today: today),
      'notReal',
    );
    expect(
      validateDob(month: 'February', day: '29', year: '2012', today: today),
      isNull,
    );
  });

  test('rejects a future date and an age under 13', () {
    expect(
      validateDob(month: '12', day: '1', year: '2027', today: today),
      'future',
    );
    expect(
      validateDob(month: 'May', day: '1', year: '2015', today: today),
      'tooYoung',
    );
    expect(
      validateDob(month: 'May', day: '1', year: '1980', today: today),
      isNull,
    );
  });

  test('keeps 13 as the named minimum age', () {
    expect(AgePolicy.minimumYears, 13);
  });

  test(
    'sends a new number to OTP and an unknown login back to register',
    () async {
      final start = StartPhoneAuth((_) async => false);
      expect(
        await start.call(mode: AuthMode.register, phoneE164: '+959254135592'),
        PhoneStart.readyForOtp,
      );
      expect(
        await start.call(mode: AuthMode.login, phoneE164: '+959254135592'),
        PhoneStart.notRegistered,
      );
    },
  );

  test(
    'sends an existing number to login and blocks a second registration',
    () async {
      final start = StartPhoneAuth((_) async => true);
      expect(
        await start.call(mode: AuthMode.login, phoneE164: '+959254135592'),
        PhoneStart.readyForOtp,
      );
      expect(
        await start.call(mode: AuthMode.register, phoneE164: '+959254135592'),
        PhoneStart.alreadyRegistered,
      );
    },
  );

  test('accepts only the fake OTP and locks on the third miss', () {
    const verify = VerifyOtp();
    expect(
      verify.call(code: OtpPolicy.fakeCode, previousFailures: 0, locked: false),
      isA<OtpAccepted>(),
    );
    expect(
      verify.call(code: '000000', previousFailures: 1, locked: false),
      isA<OtpRejected>(),
    );
    final locked = verify.call(
      code: '000000',
      previousFailures: 2,
      locked: false,
    );
    expect(locked, isA<OtpLocked>());
    expect((locked as OtpLocked).failures, OtpPolicy.maxAttempts);
  });

  test('keeps the session when secure storage cannot start', () async {
    final file = File('${Directory.systemTemp.path}/jdonuts-session-test.json');
    if (await file.exists()) {
      await file.delete();
    }
    Future<String?> failRead(String key) async => throw StateError('down');
    Future<void> failWrite(String key, String value) async =>
        throw StateError('down');
    Future<void> failDelete(String key) async => throw StateError('down');

    final store = SecureSessionStore(
      fallbackFile: file,
      readSecure: failRead,
      writeSecure: failWrite,
      deleteSecure: failDelete,
    );
    await store.write(const Session(userId: 'u1', phoneE164: '+959254135592'));

    final restored = await SecureSessionStore(
      fallbackFile: file,
      readSecure: failRead,
      writeSecure: failWrite,
      deleteSecure: failDelete,
    ).read();
    expect(restored?.userId, 'u1');
    expect(restored?.phoneE164, '+959254135592');

    await store.clear();
    expect(await file.exists(), isFalse);
  });
}
