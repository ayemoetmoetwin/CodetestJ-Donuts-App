import 'package:freezed_annotation/freezed_annotation.dart';

part 'rewards_snapshot.freezed.dart';
part 'rewards_snapshot.g.dart';

@freezed
abstract class Challenge with _$Challenge {
  const Challenge._();

  const factory Challenge({
    required String id,
    required String title,
    required int progress,
    required int goal,
    required int rewardPoints,
    required String art,
    required String tab,
    required bool claimed,
  }) = _Challenge;

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);

  bool get isComplete => progress >= goal;

  bool get isClaimed => claimed;

  bool get canClaim => isComplete && !isClaimed && rewardPoints > 0;
}

@freezed
abstract class ClaimedReward with _$ClaimedReward {
  const factory ClaimedReward({required int points, required int badge}) =
      _ClaimedReward;

  factory ClaimedReward.fromJson(Map<String, dynamic> json) =>
      _$ClaimedRewardFromJson(json);
}

@freezed
abstract class RewardsSnapshot with _$RewardsSnapshot {
  const factory RewardsSnapshot({
    required String memberName,
    required String tier,
    required int points,
    required int pointsToNext,
    required String nextTier,
    required double tierProgress,
    required int rewardsBadge,
    required List<Challenge> challenges,
  }) = _RewardsSnapshot;

  factory RewardsSnapshot.fromJson(Map<String, dynamic> json) =>
      _$RewardsSnapshotFromJson(json);
}
