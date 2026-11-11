import 'dart:math' as math;

import 'package:drift/drift.dart';
import 'package:jdonuts_app/core/database/app_database.dart' as db;
import 'package:jdonuts_app/core/failure/app_failure.dart';
import 'package:jdonuts_app/core/result/result.dart';
import 'package:jdonuts_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:jdonuts_app/features/rewards/domain/entities/rewards_snapshot.dart';
import 'package:jdonuts_app/features/rewards/domain/member_tier.dart';
import 'package:jdonuts_app/features/rewards/domain/repositories/rewards_repository.dart';

class RewardsRepositoryImpl implements RewardsRepository {
  RewardsRepositoryImpl(this._database, [this._session]);

  final db.AppDatabase _database;
  final SessionStore? _session;

  @override
  Future<Result<RewardsSnapshot>> load() async {
    try {
      await _database.ensureChallengeClaimed();
      await _database.ensureAccountClaims();
      // One local member row, shared with Home. Collected challenges are
      // stored on the signed-in account so a new member still sees Earn.
      final member = await _database.select(_database.members).getSingle();
      final collected = await _collectedIds() ?? <String>{};
      final rows = await (_database.select(
        _database.challenges,
      )..orderBy([(row) => OrderingTerm.asc(row.position)])).get();
      return Success(
        RewardsSnapshot(
          memberName: member.name,
          tier: member.tier,
          points: member.points,
          pointsToNext: member.pointsToNext,
          nextTier: member.nextTier,
          tierProgress: member.tierProgress,
          rewardsBadge: member.rewardsBadge,
          challenges: [
            for (final row in rows)
              _challenge(row, collected.contains(row.id)),
          ],
        ),
      );
    } on Object {
      return const Failure(DatabaseFailure());
    }
  }

  @override
  Future<Result<void>> savePoints(int points) async {
    try {
      final stored = math.min(math.max(points, 0), 680000);
      final standing = MemberStanding.fromPoints(stored);
      await _database
          .update(_database.members)
          .write(
            db.MembersCompanion(
              points: Value(stored),
              tier: Value(standing.tier),
              nextTier: Value(standing.nextTier),
              pointsToNext: Value(standing.pointsToNext),
              tierProgress: Value(standing.progress),
            ),
          );
      return const Success(null);
    } on Object {
      return const Failure(DatabaseFailure());
    }
  }

  @override
  Future<Result<ClaimedReward>> claim(String challengeId) async {
    try {
      await _database.ensureChallengeClaimed();
      await _database.ensureAccountClaims();
      final claimed = await _database.transaction(() async {
        final row = await (_database.select(
          _database.challenges,
        )..where((item) => item.id.equals(challengeId))).getSingle();
        final member = await _database.select(_database.members).getSingle();
        final collected = await _collectedIds();
        final already = collected?.contains(challengeId) ?? row.claimed;
        if (already || row.progress < row.goal || row.rewardPoints <= 0) {
          return ClaimedReward(
            points: member.points,
            badge: member.rewardsBadge,
          );
        }
        final userId = await _userId();
        if (userId == null) {
          await (_database.update(
            _database.challenges,
          )..where((item) => item.id.equals(challengeId))).write(
            const db.ChallengesCompanion(claimed: Value(true)),
          );
        } else {
          final nextIds = {...collected ?? <String>{}, challengeId};
          await _database.customStatement(
            'UPDATE accounts SET claimed_challenges = ? WHERE id = ?',
            [nextIds.join(','), userId],
          );
        }
        // Earn writes the new total and adds 1 to the rewards badge.
        final next = math.min(680000, member.points + row.rewardPoints);
        final standing = MemberStanding.fromPoints(next);
        final badge = member.rewardsBadge + 1;
        await _database
            .update(_database.members)
            .write(
              db.MembersCompanion(
                points: Value(next),
                tier: Value(standing.tier),
                nextTier: Value(standing.nextTier),
                pointsToNext: Value(standing.pointsToNext),
                tierProgress: Value(standing.progress),
                rewardsBadge: Value(badge),
              ),
            );
        return ClaimedReward(points: next, badge: badge);
      });
      return Success(claimed);
    } on Object {
      return const Failure(DatabaseFailure());
    }
  }

  Future<String?> _userId() async {
    final session = await _session?.read();
    return session?.userId;
  }

  /// Null when nobody is signed in, so the shared challenge flag is used.
  Future<Set<String>?> _collectedIds() async {
    final userId = await _userId();
    if (userId == null) {
      return null;
    }
    final rows = await _database
        .customSelect(
          'SELECT claimed_challenges FROM accounts WHERE id = ?',
          variables: [Variable.withString(userId)],
        )
        .get();
    if (rows.isEmpty) {
      return {};
    }
    final raw = rows.single.read<String>('claimed_challenges');
    if (raw == '-' || raw.isEmpty) {
      return {};
    }
    return raw.split(',').where((id) => id.isNotEmpty).toSet();
  }

  Challenge _challenge(db.Challenge row, bool claimed) {
    return Challenge(
      id: row.id,
      title: row.title,
      progress: row.progress,
      goal: row.goal,
      rewardPoints: row.rewardPoints,
      art: row.art,
      tab: row.tabKind,
      claimed: claimed,
    );
  }
}
