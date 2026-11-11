// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Challenge _$ChallengeFromJson(Map<String, dynamic> json) => _Challenge(
  id: json['id'] as String,
  title: json['title'] as String,
  progress: (json['progress'] as num).toInt(),
  goal: (json['goal'] as num).toInt(),
  rewardPoints: (json['rewardPoints'] as num).toInt(),
  art: json['art'] as String,
  tab: json['tab'] as String,
  claimed: json['claimed'] as bool,
);

Map<String, dynamic> _$ChallengeToJson(_Challenge instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'progress': instance.progress,
      'goal': instance.goal,
      'rewardPoints': instance.rewardPoints,
      'art': instance.art,
      'tab': instance.tab,
      'claimed': instance.claimed,
    };

_ClaimedReward _$ClaimedRewardFromJson(Map<String, dynamic> json) =>
    _ClaimedReward(
      points: (json['points'] as num).toInt(),
      badge: (json['badge'] as num).toInt(),
    );

Map<String, dynamic> _$ClaimedRewardToJson(_ClaimedReward instance) =>
    <String, dynamic>{'points': instance.points, 'badge': instance.badge};

_RewardsSnapshot _$RewardsSnapshotFromJson(Map<String, dynamic> json) =>
    _RewardsSnapshot(
      memberName: json['memberName'] as String,
      tier: json['tier'] as String,
      points: (json['points'] as num).toInt(),
      pointsToNext: (json['pointsToNext'] as num).toInt(),
      nextTier: json['nextTier'] as String,
      tierProgress: (json['tierProgress'] as num).toDouble(),
      rewardsBadge: (json['rewardsBadge'] as num).toInt(),
      challenges: (json['challenges'] as List<dynamic>)
          .map((e) => Challenge.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RewardsSnapshotToJson(_RewardsSnapshot instance) =>
    <String, dynamic>{
      'memberName': instance.memberName,
      'tier': instance.tier,
      'points': instance.points,
      'pointsToNext': instance.pointsToNext,
      'nextTier': instance.nextTier,
      'tierProgress': instance.tierProgress,
      'rewardsBadge': instance.rewardsBadge,
      'challenges': instance.challenges.map((e) => e.toJson()).toList(),
    };
