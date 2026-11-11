import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jdonuts_app/core/motion/motion.dart';

class LocaleController extends AsyncNotifier<String?> {
  static const _key = 'jdonuts.locale';
  static final _storageWait = underTest
      ? Duration.zero
      : const Duration(seconds: 2);
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(enforceBiometrics: false),
  );

  @override
  Future<String?> build() => _read();

  Future<void> choose(String code) async {
    state = AsyncData(code);
    try {
      await _storage.write(key: _key, value: code).timeout(_storageWait);
    } on Object {
      // The choice still applies for this run.
    }
  }

  Future<String?> _read() async {
    try {
      final code = await _storage.read(key: _key).timeout(_storageWait);
      if (code == 'en' || code == 'my') {
        return code;
      }
    } on Object {
      // Follow the phone language when storage is unavailable.
    }
    return null;
  }
}

final localeProvider = AsyncNotifierProvider<LocaleController, String?>(
  LocaleController.new,
);
