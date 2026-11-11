import 'package:drift/drift.dart';
import 'package:jdonuts_app/core/database/app_database.dart';
import 'package:jdonuts_app/features/auth/domain/entities/app_user.dart';
import 'package:jdonuts_app/features/rewards/domain/member_tier.dart';

class MemberAccountLink {
  MemberAccountLink(this._database);

  final AppDatabase _database;
  static const placeholderPhoto = 'assets/images/avatar_hania.png';

  Future<void> apply(Session session, {bool fresh = false}) async {
    final account = await (_database.select(
      _database.accounts,
    )..where((row) => row.id.equals(session.userId))).getSingleOrNull();
    if (account == null) {
      return;
    }
    // A new account starts at 0 on the same member row Home and Rewards read.
    // A later login only updates the name, so earned points stay.
    final standing = MemberStanding.fromPoints(0);
    if (fresh) {
      await _database.ensureAccountClaims();
      await _database.customStatement(
        "UPDATE accounts SET claimed_challenges = '-' WHERE id = ?",
        [session.userId],
      );
    }
    await _database
        .update(_database.members)
        .write(
          MembersCompanion(
            name: Value(_displayName(account)),
            photoAsset: const Value(placeholderPhoto),
            points: fresh ? const Value(0) : const Value.absent(),
            tier: fresh ? Value(standing.tier) : const Value.absent(),
            nextTier: fresh ? Value(standing.nextTier) : const Value.absent(),
            pointsToNext: fresh
                ? Value(standing.pointsToNext)
                : const Value.absent(),
            tierProgress: fresh
                ? Value(standing.progress)
                : const Value.absent(),
            rewardsBadge: fresh ? const Value(0) : const Value.absent(),
          ),
        );
  }

  String _displayName(Account account) {
    final first = account.firstName.trim();
    final last = account.lastName.trim();
    if (last.isEmpty) {
      return first;
    }
    return '$first $last';
  }
}
