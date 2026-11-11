// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_standing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemberStanding _$MemberStandingFromJson(Map<String, dynamic> json) =>
    _MemberStanding(
      tier: json['tier'] as String,
      nextTier: json['nextTier'] as String,
      pointsToNext: (json['pointsToNext'] as num).toInt(),
      progress: (json['progress'] as num).toDouble(),
    );

Map<String, dynamic> _$MemberStandingToJson(_MemberStanding instance) =>
    <String, dynamic>{
      'tier': instance.tier,
      'nextTier': instance.nextTier,
      'pointsToNext': instance.pointsToNext,
      'progress': instance.progress,
    };
