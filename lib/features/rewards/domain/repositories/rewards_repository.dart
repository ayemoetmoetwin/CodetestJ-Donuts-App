import 'package:jdonuts_app/core/result/result.dart';
import 'package:jdonuts_app/features/rewards/domain/entities/rewards_snapshot.dart';

abstract class RewardsRepository {
  Future<Result<RewardsSnapshot>> load();

  Future<Result<void>> savePoints(int points);

  Future<Result<ClaimedReward>> claim(String challengeId);
}
