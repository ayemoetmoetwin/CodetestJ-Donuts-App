import 'package:jdonuts_app/core/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

final clockProvider = Provider<DateTime Function()>((ref) => DateTime.now);
