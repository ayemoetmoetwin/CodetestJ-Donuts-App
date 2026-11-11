enum PhoneStart { readyForOtp, notRegistered, alreadyRegistered }

enum AuthMode { register, login }

class StartPhoneAuth {
  const StartPhoneAuth(this._exists);

  final Future<bool> Function(String phoneE164) _exists;

  Future<PhoneStart> call({
    required AuthMode mode,
    required String phoneE164,
  }) async {
    final exists = await _exists(phoneE164);
    if (mode == AuthMode.login && !exists) {
      return PhoneStart.notRegistered;
    }
    if (mode == AuthMode.register && exists) {
      return PhoneStart.alreadyRegistered;
    }
    return PhoneStart.readyForOtp;
  }
}
