import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jdonuts_app/core/database/app_database.dart';
import 'package:jdonuts_app/core/failure/app_failure.dart';
import 'package:jdonuts_app/core/result/result.dart';
import 'package:jdonuts_app/features/auth/domain/auth_policy.dart';
import 'package:jdonuts_app/features/auth/domain/entities/app_user.dart';
import 'package:jdonuts_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:path_provider/path_provider.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._database, {this.latency = AuthPolicy.fakeLatency});

  final AppDatabase _database;
  final Duration latency;

  @override
  Future<Result<bool>> phoneExists(String phoneE164) async {
    try {
      await Future<void>.delayed(latency);
      final row =
          await (_database.select(_database.accounts)
                ..where((account) => account.phoneE164.equals(phoneE164)))
              .getSingleOrNull();
      return Success(row != null);
    } on Object {
      return const Failure(DatabaseFailure());
    }
  }

  @override
  Future<Result<void>> pause() async {
    await Future<void>.delayed(latency);
    return const Success(null);
  }

  @override
  Future<Result<AppUser?>> findByPhone(String phoneE164) async {
    try {
      final row =
          await (_database.select(_database.accounts)
                ..where((account) => account.phoneE164.equals(phoneE164)))
              .getSingleOrNull();
      if (row == null) {
        return const Success(null);
      }
      return Success(_map(row));
    } on Object {
      return const Failure(DatabaseFailure());
    }
  }

  @override
  Future<Result<AppUser>> register(NewUser user) async {
    try {
      await Future<void>.delayed(latency);
      final id = 'user_${user.phoneE164}';
      await _database
          .into(_database.accounts)
          .insertOnConflictUpdate(
            AccountsCompanion.insert(
              id: id,
              phoneE164: user.phoneE164,
              firstName: user.firstName.trim(),
              lastName: Value(user.lastName.trim()),
              birthIso: user.birthDate.toIso8601String(),
            ),
          );
      await _database.ensureAccountClaims();
      await _database.customStatement(
        "UPDATE accounts SET claimed_challenges = '-' WHERE id = ?",
        [id],
      );
      return Success(
        AppUser(
          id: id,
          phoneE164: user.phoneE164,
          firstName: user.firstName.trim(),
          lastName: user.lastName.trim(),
          birthDate: user.birthDate,
        ),
      );
    } on Object {
      return const Failure(DatabaseFailure());
    }
  }

  AppUser _map(Account row) {
    return AppUser(
      id: row.id,
      phoneE164: row.phoneE164,
      firstName: row.firstName,
      lastName: row.lastName,
      birthDate: DateTime.parse(row.birthIso),
    );
  }
}

class SecureSessionStore implements SessionStore {
  SecureSessionStore({
    FlutterSecureStorage? storage,
    File? fallbackFile,
    Future<String?> Function(String key)? readSecure,
    Future<void> Function(String key, String value)? writeSecure,
    Future<void> Function(String key)? deleteSecure,
  }) : _fallbackFile = fallbackFile,
       _readSecureValue = readSecure ?? ((key) => _box(storage).read(key: key)),
       _writeSecureValue =
           writeSecure ??
           ((key, value) => _box(storage).write(key: key, value: value)),
       _deleteSecureValue =
           deleteSecure ?? ((key) => _box(storage).delete(key: key));

  static const _shared = FlutterSecureStorage(
    aOptions: AndroidOptions(enforceBiometrics: false),
  );

  static FlutterSecureStorage _box(FlutterSecureStorage? storage) =>
      storage ?? _shared;

  final File? _fallbackFile;
  final Future<String?> Function(String key) _readSecureValue;
  final Future<void> Function(String key, String value) _writeSecureValue;
  final Future<void> Function(String key) _deleteSecureValue;
  static const _key = 'jdonuts.session';
  static const _storageTimeout = Duration(seconds: 2);

  @override
  Future<Session?> read() async {
    final secure = await _readSecure();
    if (secure != null) {
      return secure;
    }
    return _readFile();
  }

  @override
  Future<void> write(Session session) async {
    final raw = jsonEncode({
      'userId': session.userId,
      'phoneE164': session.phoneE164,
    });
    await _writeSecure(raw);
    final file = await _file();
    await file.parent.create(recursive: true);
    await file.writeAsString(raw, flush: true);
  }

  @override
  Future<void> clear() async {
    await _deleteSecure();
    final file = await _file();
    if (await file.exists()) {
      await file.delete();
    }
  }

  Future<Session?> _readSecure() async {
    try {
      final raw = await _readSecureValue(_key).timeout(_storageTimeout);
      if (raw == null || raw.isEmpty) {
        return null;
      }
      return _decode(raw);
    } on Object {
      return null;
    }
  }

  Future<void> _writeSecure(String raw) async {
    try {
      await _writeSecureValue(_key, raw).timeout(_storageTimeout);
    } on Object {
      // Some Android images cannot start the secure-storage plugin.
    }
  }

  Future<void> _deleteSecure() async {
    try {
      await _deleteSecureValue(_key).timeout(_storageTimeout);
    } on Object {
      // The private file is still removed below.
    }
  }

  Future<Session?> _readFile() async {
    final file = await _file();
    if (!await file.exists()) {
      return null;
    }
    final raw = await file.readAsString();
    if (raw.isEmpty) {
      return null;
    }
    return _decode(raw);
  }

  Future<File> _file() async {
    final injected = _fallbackFile;
    if (injected != null) {
      return injected;
    }
    final directory = await getApplicationSupportDirectory();
    return File('${directory.path}/jdonuts.session.json');
  }

  Session _decode(String raw) {
    final json = jsonDecode(raw) as Map<String, dynamic>;
    return Session(
      userId: json['userId'] as String,
      phoneE164: json['phoneE164'] as String,
    );
  }
}

class MemorySessionStore implements SessionStore {
  Session? _session;

  @override
  Future<void> clear() async => _session = null;

  @override
  Future<Session?> read() async => _session;

  @override
  Future<void> write(Session session) async => _session = session;
}
