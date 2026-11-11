import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts_app/core/database/app_database.dart';
import 'package:jdonuts_app/core/result/result.dart';
import 'package:jdonuts_app/features/rewards/data/rewards_repository_impl.dart';
import 'package:jdonuts_app/features/rewards/domain/entities/rewards_snapshot.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('claiming a finished challenge adds one rewards badge', () async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    await database
        .into(database.members)
        .insert(
          MembersCompanion.insert(
            id: const Value(1),
            name: 'Hania',
            tier: 'bronze',
            points: 0,
            pointsToNext: 1290,
            nextTier: 'gold',
            tierProgress: 0,
            notificationCount: 0,
            rewardsBadge: 3,
            photoAsset: 'assets/images/avatar_hania.png',
          ),
        );
    await database
        .into(database.challenges)
        .insert(
          ChallengesCompanion.insert(
            id: 'c_coco_done',
            title: 'Eat 4 Coco donuts',
            progress: 4,
            goal: 4,
            rewardPoints: 100,
            art: 'donut',
            tabKind: 'earn',
            position: 0,
          ),
        );
    final rewards = RewardsRepositoryImpl(database);

    final claimed = await rewards.claim('c_coco_done');
    expect(
      claimed,
      isA<Success<ClaimedReward>>().having(
        (result) =>
            result.when(success: (value) => value.badge, failure: (_) => null),
        'badge',
        4,
      ),
    );

    final again = await rewards.claim('c_coco_done');
    again.when(
      success: (value) => expect(value.badge, 4),
      failure: (error) => fail(error.code),
    );
  });
}
