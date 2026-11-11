import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_tier.freezed.dart';
part 'member_tier.g.dart';

@freezed
abstract class MemberStanding with _$MemberStanding {
  const MemberStanding._();

  const factory MemberStanding({
    required String tier,
    required String nextTier,
    required int pointsToNext,
    required double progress,
    required String chosen,
  }) = _MemberStanding;

  factory MemberStanding.fromJson(Map<String, dynamic> json) =>
      _$MemberStandingFromJson(json);

  static const goldAt = 1290;
  static const platinumAt = 500000;

  factory MemberStanding.fromPoints(int points) {
    final safe = points.clamp(0, 680000);
    if (safe <= 0) {
      return MemberStanding(
        tier: 'bronze',
        nextTier: 'gold',
        pointsToNext: goldAt,
        progress: 0,
        chosen: 'gold',
      );
    }
    if (safe < goldAt) {
      return MemberStanding(
        tier: 'silver',
        nextTier: 'gold',
        pointsToNext: goldAt - safe,
        progress: safe / goldAt,
        chosen: 'silver',
      );
    }
    if (safe < platinumAt) {
      final span = platinumAt - goldAt;
      return MemberStanding(
        tier: 'gold',
        nextTier: 'platinum',
        pointsToNext: platinumAt - safe,
        progress: (safe - goldAt) / span,
        chosen: safe <= goldAt ? 'gold' : 'platinum',
      );
    }
    return const MemberStanding(
      tier: 'platinum',
      nextTier: 'platinum',
      pointsToNext: 0,
      progress: 1,
      chosen: 'platinum',
    );
  }
}
