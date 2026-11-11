import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_standing.freezed.dart';
part 'member_standing.g.dart';

@freezed
abstract class MemberStanding with _$MemberStanding {
  const MemberStanding._();

  const factory MemberStanding({
    required String tier,
    required String nextTier,
    required int pointsToNext,
    required double progress,
  }) = _MemberStanding;

  factory MemberStanding.fromJson(Map<String, dynamic> json) =>
      _$MemberStandingFromJson(json);

  static const goldAt = 1290;
  static const platinumAt = 500000;

  static MemberStanding fromPoints(int points) {
    final safe = points < 0 ? 0 : points;
    if (safe >= platinumAt) {
      return const MemberStanding(
        tier: 'platinum',
        nextTier: 'platinum',
        pointsToNext: 0,
        progress: 1,
      );
    }
    if (safe >= goldAt) {
      final span = platinumAt - goldAt;
      return MemberStanding(
        tier: 'gold',
        nextTier: 'platinum',
        pointsToNext: platinumAt - safe,
        progress: (safe - goldAt) / span,
      );
    }
    return MemberStanding(
      tier: 'silver',
      nextTier: 'gold',
      pointsToNext: goldAt - safe,
      progress: safe / goldAt,
    );
  }
}
