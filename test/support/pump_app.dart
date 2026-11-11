import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts_app/app.dart';
import 'package:jdonuts_app/core/database/app_database.dart';
import 'package:jdonuts_app/core/database/database_provider.dart';
import 'package:jdonuts_app/core/database/database_seeder.dart';
import 'package:jdonuts_app/core/network/network_checker.dart';
import 'package:jdonuts_app/core/providers.dart';
import 'package:jdonuts_app/features/auth/data/auth_repository_impl.dart';

Future<AppDatabase> _openTestDatabase() async {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  final database = AppDatabase(NativeDatabase.memory());
  await DatabaseSeeder(database).seedIfEmpty();
  return database;
}

class FakeNetwork implements NetworkChecker {
  FakeNetwork(this.online);

  final bool online;

  @override
  Future<bool> isOnline() async => online;

  @override
  Stream<bool> watch() => Stream<bool>.value(online);
}

Future<void> pumpJdonuts(
  WidgetTester tester, {
  bool online = true,
  DateTime? now,
}) async {
  await tester.pumpWidget(const SizedBox.shrink());
  final database = await _openTestDatabase();
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(database),
        sessionStoreProvider.overrideWithValue(MemorySessionStore()),
        authRepositoryProvider.overrideWith(
          (ref) => AuthRepositoryImpl(
            ref.watch(databaseProvider),
            latency: Duration.zero,
          ),
        ),
        networkCheckerProvider.overrideWithValue(FakeNetwork(online)),
        clockProvider.overrideWithValue(() => now ?? DateTime(2026, 11, 9)),
      ],
      child: const JDonutsApp(),
    ),
  );
  for (var frame = 0; frame < 40; frame++) {
    await tester.pump(const Duration(milliseconds: 50));
    if (find.text("LET'S GET STARTED").evaluate().isNotEmpty) {
      return;
    }
  }
}

Future<void> settle(WidgetTester tester) async {
  for (var frame = 0; frame < 15; frame++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}

Future<void> tapContinue(WidgetTester tester) async {
  await tester.tap(find.byKey(const Key('continue-button')));
  await settle(tester);
}

Future<void> typeInto(WidgetTester tester, Finder finder, String value) async {
  final field = tester.widget<TextFormField>(finder);
  field.controller!.value = TextEditingValue(
    text: value,
    selection: TextSelection.collapsed(offset: value.length),
  );
  await tester.pump();
}
