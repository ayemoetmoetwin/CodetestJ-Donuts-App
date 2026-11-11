import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdonuts_app/core/database/database_provider.dart';
import 'package:jdonuts_app/core/providers.dart';
import 'package:jdonuts_app/core/result/result.dart';
import 'package:jdonuts_app/features/auth/domain/auth_policy.dart';
import 'package:jdonuts_app/features/auth/domain/entities/app_user.dart';
import 'package:jdonuts_app/features/auth/domain/usecases/start_phone_auth.dart';
import 'package:jdonuts_app/features/auth/domain/usecases/verify_otp.dart';
import 'package:jdonuts_app/features/auth/domain/validators/dob_validator.dart';
import 'package:jdonuts_app/features/auth/domain/validators/phone_validator.dart';
import 'package:jdonuts_app/features/auth/presentation/auth_flow_state.dart';
import 'package:jdonuts_app/features/auth/presentation/session_controller.dart';
import 'package:jdonuts_app/features/home/presentation/catalog_providers.dart';

enum AuthNext { stay, otp, name, dob, welcome, home }

class AuthController extends Notifier<AuthFlowState> {
  @override
  AuthFlowState build() => const AuthFlowState();

  void begin(AuthMode mode) => state = AuthFlowState(mode: mode);

  void setPhone(String value) {
    state = state.copyWith(phone: value, banner: AuthBanner.none);
  }

  void setOtp(String value) => state = state.copyWith(otp: value);

  void setFirstName(String value) => state = state.copyWith(firstName: value);

  void setLastName(String value) => state = state.copyWith(lastName: value);

  void setMonth(String value) => state = state.copyWith(month: value);

  void setDay(String value) => state = state.copyWith(day: value);

  void setYear(String value) => state = state.copyWith(year: value);

  void setBirthDate({
    required String month,
    required String day,
    required String year,
  }) {
    state = state.copyWith(
      month: month,
      day: day,
      year: year,
      dobTouched: true,
    );
  }

  void touchPhone() => state = state.copyWith(phoneTouched: true);

  void touchName() => state = state.copyWith(nameTouched: true);

  void touchDob() => state = state.copyWith(dobTouched: true);

  void useRegister() {
    state = state.copyWith(mode: AuthMode.register, banner: AuthBanner.none);
  }

  void useLogin() {
    state = state.copyWith(mode: AuthMode.login, banner: AuthBanner.none);
  }

  Future<AuthNext> submitPhone() async {
    if (state.submitting) {
      return AuthNext.stay;
    }
    state = state.copyWith(phoneTouched: true, banner: AuthBanner.none);
    final phone = parsePhone(state.phone);
    if (phone == null) {
      return AuthNext.stay;
    }
    state = state.copyWith(submitting: true);
    final result = await ref
        .read(authRepositoryProvider)
        .phoneExists(phone.e164);
    if (result is! Success<bool>) {
      state = state.copyWith(submitting: false);
      return AuthNext.stay;
    }
    final next = await StartPhoneAuth(
      (_) async => result.value,
    ).call(mode: state.mode, phoneE164: phone.e164);
    state = state.copyWith(submitting: false);
    return switch (next) {
      PhoneStart.notRegistered => _banner(AuthBanner.notRegistered),
      PhoneStart.alreadyRegistered => _banner(AuthBanner.alreadyRegistered),
      PhoneStart.readyForOtp => _readyForOtp(),
    };
  }

  AuthNext _readyForOtp() {
    state = state.copyWith(resendAt: _resendDeadline());
    return AuthNext.otp;
  }

  AuthNext _banner(AuthBanner banner) {
    state = state.copyWith(banner: banner);
    return AuthNext.stay;
  }

  DateTime _resendDeadline() {
    return ref.read(clockProvider)().add(OtpPolicy.resendAfter);
  }

  Future<AuthNext> submitOtp() async {
    if (state.submitting || state.otpLocked) {
      return AuthNext.stay;
    }
    state = state.copyWith(submitting: true);
    final paused = await ref.read(authRepositoryProvider).pause();
    if (paused is Failure<void>) {
      state = state.copyWith(submitting: false);
      return AuthNext.stay;
    }
    final verdict = const VerifyOtp().call(
      code: state.otp,
      previousFailures: state.otpFailures,
      locked: false,
    );
    return switch (verdict) {
      OtpAccepted() => _afterAcceptedOtp(),
      OtpRejected(:final failures) => _rejectOtp(failures, locked: false),
      OtpLocked(:final failures) => _rejectOtp(failures, locked: true),
    };
  }

  AuthNext _rejectOtp(int failures, {required bool locked}) {
    state = state.copyWith(
      submitting: false,
      otp: '',
      otpFailures: failures,
      otpLocked: locked,
      otpError: true,
      shake: state.shake + 1,
    );
    return AuthNext.stay;
  }

  Future<AuthNext> _afterAcceptedOtp() async {
    if (state.mode == AuthMode.register) {
      state = state.copyWith(submitting: false, otpError: false);
      return AuthNext.name;
    }
    final phone = parsePhone(state.phone);
    final found = await ref
        .read(authRepositoryProvider)
        .findByPhone(phone!.e164);
    if (found is! Success<AppUser?> || found.value == null) {
      state = state.copyWith(submitting: false);
      return AuthNext.stay;
    }
    final user = found.value!;
    await ref
        .read(sessionProvider.notifier)
        .open(Session(userId: user.id, phoneE164: user.phoneE164));
    state = state.copyWith(submitting: false, otpError: false);
    return AuthNext.home;
  }

  Future<AuthNext> submitName() async {
    if (state.submitting) {
      return AuthNext.stay;
    }
    state = state.copyWith(nameTouched: true);
    if (!state.nameReady) {
      return AuthNext.stay;
    }
    state = state.copyWith(submitting: true);
    await ref.read(authRepositoryProvider).pause();
    state = state.copyWith(submitting: false);
    return AuthNext.dob;
  }

  Future<AuthNext> submitDob() async {
    if (state.submitting) {
      return AuthNext.stay;
    }
    final today = ref.read(clockProvider)();
    state = state.copyWith(dobTouched: true);
    final parsed = parseDob(
      month: state.month,
      day: state.day,
      year: state.year,
      today: today,
    );
    final phone = parsePhone(state.phone);
    if (parsed.date == null || phone == null) {
      return AuthNext.stay;
    }
    state = state.copyWith(submitting: true);
    final created = await ref
        .read(authRepositoryProvider)
        .register(
          NewUser(
            phoneE164: phone.e164,
            firstName: state.firstName,
            lastName: state.lastName,
            birthDate: parsed.date!,
          ),
        );
    if (created is! Success<AppUser>) {
      state = state.copyWith(submitting: false);
      return AuthNext.stay;
    }
    ref.read(showWelcomeProvider.notifier).state = true;
    await ref
        .read(sessionProvider.notifier)
        .open(
          Session(userId: created.value.id, phoneE164: created.value.phoneE164),
          fresh: true,
        );
    ref.invalidate(homeProvider);
    ref.invalidate(rewardsProvider);
    state = state.copyWith(submitting: false);
    return AuthNext.welcome;
  }

  Future<void> resend() async {
    final deadline = state.resendAt;
    final now = ref.read(clockProvider)();
    if (state.submitting || deadline == null || now.isBefore(deadline)) {
      return;
    }
    state = state.copyWith(submitting: true);
    await ref.read(authRepositoryProvider).pause();
    state = state.copyWith(
      submitting: false,
      otp: '',
      otpFailures: 0,
      otpLocked: false,
      otpError: false,
      resendAt: _resendDeadline(),
    );
  }
}

final authControllerProvider = NotifierProvider<AuthController, AuthFlowState>(
  AuthController.new,
);
