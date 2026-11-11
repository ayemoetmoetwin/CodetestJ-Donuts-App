import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:jdonuts_app/core/database/tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Accounts,
    Members,
    Products,
    Banners,
    Sections,
    SectionProducts,
    Shops,
    Challenges,
    CartLines,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'jdonuts'));

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (migrator) => migrator.createAll(),
      onUpgrade: (migrator, from, to) async {
        if (from < 2) {
          await migrator.createTable(cartLines);
        }
        if (from < 3 && !await _challengeClaimedColumn()) {
          await migrator.addColumn(challenges, challenges.claimed);
        }
        if (from < 4) {
          await ensureAccountClaims();
        }
      },
    );
  }

  Future<void> ensureAccountClaims() async {
    if (await _hasColumn('accounts', 'claimed_challenges')) {
      return;
    }
    try {
      await customStatement(
        "ALTER TABLE accounts ADD COLUMN claimed_challenges TEXT NOT NULL DEFAULT ''",
      );
    } on Object {
      if (!await _hasColumn('accounts', 'claimed_challenges')) {
        rethrow;
      }
    }
  }

  Future<bool> _hasColumn(String table, String name) async {
    final rows = await customSelect('PRAGMA table_info($table)').get();
    return rows.any((row) => row.read<String>('name') == name);
  }

  Future<void> ensureChallengeClaimed() async {
    if (await _challengeClaimedColumn()) {
      return;
    }
    try {
      await customStatement(
        'ALTER TABLE challenges ADD COLUMN claimed INTEGER NOT NULL DEFAULT 0',
      );
    } on Object {
      if (!await _challengeClaimedColumn()) {
        rethrow;
      }
    }
  }

  Future<bool> _challengeClaimedColumn() async {
    final rows = await customSelect('PRAGMA table_info(challenges)').get();
    return rows.any((row) => row.read<String>('name') == 'claimed');
  }
}
