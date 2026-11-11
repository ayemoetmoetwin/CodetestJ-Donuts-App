// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rewards_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Challenge {

 String get id; String get title; int get progress; int get goal; int get rewardPoints; String get art; String get tab; bool get claimed;
/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeCopyWith<Challenge> get copyWith => _$ChallengeCopyWithImpl<Challenge>(this as Challenge, _$identity);

  /// Serializes this Challenge to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Challenge&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.rewardPoints, rewardPoints) || other.rewardPoints == rewardPoints)&&(identical(other.art, art) || other.art == art)&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.claimed, claimed) || other.claimed == claimed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,progress,goal,rewardPoints,art,tab,claimed);

@override
String toString() {
  return 'Challenge(id: $id, title: $title, progress: $progress, goal: $goal, rewardPoints: $rewardPoints, art: $art, tab: $tab, claimed: $claimed)';
}


}

/// @nodoc
abstract mixin class $ChallengeCopyWith<$Res>  {
  factory $ChallengeCopyWith(Challenge value, $Res Function(Challenge) _then) = _$ChallengeCopyWithImpl;
@useResult
$Res call({
 String id, String title, int progress, int goal, int rewardPoints, String art, String tab, bool claimed
});




}
/// @nodoc
class _$ChallengeCopyWithImpl<$Res>
    implements $ChallengeCopyWith<$Res> {
  _$ChallengeCopyWithImpl(this._self, this._then);

  final Challenge _self;
  final $Res Function(Challenge) _then;

/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? progress = null,Object? goal = null,Object? rewardPoints = null,Object? art = null,Object? tab = null,Object? claimed = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int,rewardPoints: null == rewardPoints ? _self.rewardPoints : rewardPoints // ignore: cast_nullable_to_non_nullable
as int,art: null == art ? _self.art : art // ignore: cast_nullable_to_non_nullable
as String,tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as String,claimed: null == claimed ? _self.claimed : claimed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Challenge].
extension ChallengePatterns on Challenge {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Challenge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Challenge() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Challenge value)  $default,){
final _that = this;
switch (_that) {
case _Challenge():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Challenge value)?  $default,){
final _that = this;
switch (_that) {
case _Challenge() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  int progress,  int goal,  int rewardPoints,  String art,  String tab,  bool claimed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Challenge() when $default != null:
return $default(_that.id,_that.title,_that.progress,_that.goal,_that.rewardPoints,_that.art,_that.tab,_that.claimed);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  int progress,  int goal,  int rewardPoints,  String art,  String tab,  bool claimed)  $default,) {final _that = this;
switch (_that) {
case _Challenge():
return $default(_that.id,_that.title,_that.progress,_that.goal,_that.rewardPoints,_that.art,_that.tab,_that.claimed);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  int progress,  int goal,  int rewardPoints,  String art,  String tab,  bool claimed)?  $default,) {final _that = this;
switch (_that) {
case _Challenge() when $default != null:
return $default(_that.id,_that.title,_that.progress,_that.goal,_that.rewardPoints,_that.art,_that.tab,_that.claimed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Challenge extends Challenge {
  const _Challenge({required this.id, required this.title, required this.progress, required this.goal, required this.rewardPoints, required this.art, required this.tab, required this.claimed}): super._();
  factory _Challenge.fromJson(Map<String, dynamic> json) => _$ChallengeFromJson(json);

@override final  String id;
@override final  String title;
@override final  int progress;
@override final  int goal;
@override final  int rewardPoints;
@override final  String art;
@override final  String tab;
@override final  bool claimed;

/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeCopyWith<_Challenge> get copyWith => __$ChallengeCopyWithImpl<_Challenge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallengeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Challenge&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.rewardPoints, rewardPoints) || other.rewardPoints == rewardPoints)&&(identical(other.art, art) || other.art == art)&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.claimed, claimed) || other.claimed == claimed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,progress,goal,rewardPoints,art,tab,claimed);

@override
String toString() {
  return 'Challenge(id: $id, title: $title, progress: $progress, goal: $goal, rewardPoints: $rewardPoints, art: $art, tab: $tab, claimed: $claimed)';
}


}

/// @nodoc
abstract mixin class _$ChallengeCopyWith<$Res> implements $ChallengeCopyWith<$Res> {
  factory _$ChallengeCopyWith(_Challenge value, $Res Function(_Challenge) _then) = __$ChallengeCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, int progress, int goal, int rewardPoints, String art, String tab, bool claimed
});




}
/// @nodoc
class __$ChallengeCopyWithImpl<$Res>
    implements _$ChallengeCopyWith<$Res> {
  __$ChallengeCopyWithImpl(this._self, this._then);

  final _Challenge _self;
  final $Res Function(_Challenge) _then;

/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? progress = null,Object? goal = null,Object? rewardPoints = null,Object? art = null,Object? tab = null,Object? claimed = null,}) {
  return _then(_Challenge(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int,rewardPoints: null == rewardPoints ? _self.rewardPoints : rewardPoints // ignore: cast_nullable_to_non_nullable
as int,art: null == art ? _self.art : art // ignore: cast_nullable_to_non_nullable
as String,tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as String,claimed: null == claimed ? _self.claimed : claimed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ClaimedReward {

 int get points; int get badge;
/// Create a copy of ClaimedReward
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClaimedRewardCopyWith<ClaimedReward> get copyWith => _$ClaimedRewardCopyWithImpl<ClaimedReward>(this as ClaimedReward, _$identity);

  /// Serializes this ClaimedReward to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClaimedReward&&(identical(other.points, points) || other.points == points)&&(identical(other.badge, badge) || other.badge == badge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,points,badge);

@override
String toString() {
  return 'ClaimedReward(points: $points, badge: $badge)';
}


}

/// @nodoc
abstract mixin class $ClaimedRewardCopyWith<$Res>  {
  factory $ClaimedRewardCopyWith(ClaimedReward value, $Res Function(ClaimedReward) _then) = _$ClaimedRewardCopyWithImpl;
@useResult
$Res call({
 int points, int badge
});




}
/// @nodoc
class _$ClaimedRewardCopyWithImpl<$Res>
    implements $ClaimedRewardCopyWith<$Res> {
  _$ClaimedRewardCopyWithImpl(this._self, this._then);

  final ClaimedReward _self;
  final $Res Function(ClaimedReward) _then;

/// Create a copy of ClaimedReward
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? badge = null,}) {
  return _then(_self.copyWith(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ClaimedReward].
extension ClaimedRewardPatterns on ClaimedReward {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClaimedReward value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClaimedReward() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClaimedReward value)  $default,){
final _that = this;
switch (_that) {
case _ClaimedReward():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClaimedReward value)?  $default,){
final _that = this;
switch (_that) {
case _ClaimedReward() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int points,  int badge)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClaimedReward() when $default != null:
return $default(_that.points,_that.badge);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int points,  int badge)  $default,) {final _that = this;
switch (_that) {
case _ClaimedReward():
return $default(_that.points,_that.badge);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int points,  int badge)?  $default,) {final _that = this;
switch (_that) {
case _ClaimedReward() when $default != null:
return $default(_that.points,_that.badge);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClaimedReward implements ClaimedReward {
  const _ClaimedReward({required this.points, required this.badge});
  factory _ClaimedReward.fromJson(Map<String, dynamic> json) => _$ClaimedRewardFromJson(json);

@override final  int points;
@override final  int badge;

/// Create a copy of ClaimedReward
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimedRewardCopyWith<_ClaimedReward> get copyWith => __$ClaimedRewardCopyWithImpl<_ClaimedReward>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClaimedRewardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimedReward&&(identical(other.points, points) || other.points == points)&&(identical(other.badge, badge) || other.badge == badge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,points,badge);

@override
String toString() {
  return 'ClaimedReward(points: $points, badge: $badge)';
}


}

/// @nodoc
abstract mixin class _$ClaimedRewardCopyWith<$Res> implements $ClaimedRewardCopyWith<$Res> {
  factory _$ClaimedRewardCopyWith(_ClaimedReward value, $Res Function(_ClaimedReward) _then) = __$ClaimedRewardCopyWithImpl;
@override @useResult
$Res call({
 int points, int badge
});




}
/// @nodoc
class __$ClaimedRewardCopyWithImpl<$Res>
    implements _$ClaimedRewardCopyWith<$Res> {
  __$ClaimedRewardCopyWithImpl(this._self, this._then);

  final _ClaimedReward _self;
  final $Res Function(_ClaimedReward) _then;

/// Create a copy of ClaimedReward
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? badge = null,}) {
  return _then(_ClaimedReward(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RewardsSnapshot {

 String get memberName; String get tier; int get points; int get pointsToNext; String get nextTier; double get tierProgress; int get rewardsBadge; List<Challenge> get challenges;
/// Create a copy of RewardsSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RewardsSnapshotCopyWith<RewardsSnapshot> get copyWith => _$RewardsSnapshotCopyWithImpl<RewardsSnapshot>(this as RewardsSnapshot, _$identity);

  /// Serializes this RewardsSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RewardsSnapshot&&(identical(other.memberName, memberName) || other.memberName == memberName)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.points, points) || other.points == points)&&(identical(other.pointsToNext, pointsToNext) || other.pointsToNext == pointsToNext)&&(identical(other.nextTier, nextTier) || other.nextTier == nextTier)&&(identical(other.tierProgress, tierProgress) || other.tierProgress == tierProgress)&&(identical(other.rewardsBadge, rewardsBadge) || other.rewardsBadge == rewardsBadge)&&const DeepCollectionEquality().equals(other.challenges, challenges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,memberName,tier,points,pointsToNext,nextTier,tierProgress,rewardsBadge,const DeepCollectionEquality().hash(challenges));

@override
String toString() {
  return 'RewardsSnapshot(memberName: $memberName, tier: $tier, points: $points, pointsToNext: $pointsToNext, nextTier: $nextTier, tierProgress: $tierProgress, rewardsBadge: $rewardsBadge, challenges: $challenges)';
}


}

/// @nodoc
abstract mixin class $RewardsSnapshotCopyWith<$Res>  {
  factory $RewardsSnapshotCopyWith(RewardsSnapshot value, $Res Function(RewardsSnapshot) _then) = _$RewardsSnapshotCopyWithImpl;
@useResult
$Res call({
 String memberName, String tier, int points, int pointsToNext, String nextTier, double tierProgress, int rewardsBadge, List<Challenge> challenges
});




}
/// @nodoc
class _$RewardsSnapshotCopyWithImpl<$Res>
    implements $RewardsSnapshotCopyWith<$Res> {
  _$RewardsSnapshotCopyWithImpl(this._self, this._then);

  final RewardsSnapshot _self;
  final $Res Function(RewardsSnapshot) _then;

/// Create a copy of RewardsSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? memberName = null,Object? tier = null,Object? points = null,Object? pointsToNext = null,Object? nextTier = null,Object? tierProgress = null,Object? rewardsBadge = null,Object? challenges = null,}) {
  return _then(_self.copyWith(
memberName: null == memberName ? _self.memberName : memberName // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,pointsToNext: null == pointsToNext ? _self.pointsToNext : pointsToNext // ignore: cast_nullable_to_non_nullable
as int,nextTier: null == nextTier ? _self.nextTier : nextTier // ignore: cast_nullable_to_non_nullable
as String,tierProgress: null == tierProgress ? _self.tierProgress : tierProgress // ignore: cast_nullable_to_non_nullable
as double,rewardsBadge: null == rewardsBadge ? _self.rewardsBadge : rewardsBadge // ignore: cast_nullable_to_non_nullable
as int,challenges: null == challenges ? _self.challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<Challenge>,
  ));
}

}


/// Adds pattern-matching-related methods to [RewardsSnapshot].
extension RewardsSnapshotPatterns on RewardsSnapshot {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RewardsSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RewardsSnapshot() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RewardsSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _RewardsSnapshot():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RewardsSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _RewardsSnapshot() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String memberName,  String tier,  int points,  int pointsToNext,  String nextTier,  double tierProgress,  int rewardsBadge,  List<Challenge> challenges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RewardsSnapshot() when $default != null:
return $default(_that.memberName,_that.tier,_that.points,_that.pointsToNext,_that.nextTier,_that.tierProgress,_that.rewardsBadge,_that.challenges);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String memberName,  String tier,  int points,  int pointsToNext,  String nextTier,  double tierProgress,  int rewardsBadge,  List<Challenge> challenges)  $default,) {final _that = this;
switch (_that) {
case _RewardsSnapshot():
return $default(_that.memberName,_that.tier,_that.points,_that.pointsToNext,_that.nextTier,_that.tierProgress,_that.rewardsBadge,_that.challenges);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String memberName,  String tier,  int points,  int pointsToNext,  String nextTier,  double tierProgress,  int rewardsBadge,  List<Challenge> challenges)?  $default,) {final _that = this;
switch (_that) {
case _RewardsSnapshot() when $default != null:
return $default(_that.memberName,_that.tier,_that.points,_that.pointsToNext,_that.nextTier,_that.tierProgress,_that.rewardsBadge,_that.challenges);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RewardsSnapshot implements RewardsSnapshot {
  const _RewardsSnapshot({required this.memberName, required this.tier, required this.points, required this.pointsToNext, required this.nextTier, required this.tierProgress, required this.rewardsBadge, required final  List<Challenge> challenges}): _challenges = challenges;
  factory _RewardsSnapshot.fromJson(Map<String, dynamic> json) => _$RewardsSnapshotFromJson(json);

@override final  String memberName;
@override final  String tier;
@override final  int points;
@override final  int pointsToNext;
@override final  String nextTier;
@override final  double tierProgress;
@override final  int rewardsBadge;
 final  List<Challenge> _challenges;
@override List<Challenge> get challenges {
  if (_challenges is EqualUnmodifiableListView) return _challenges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_challenges);
}


/// Create a copy of RewardsSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RewardsSnapshotCopyWith<_RewardsSnapshot> get copyWith => __$RewardsSnapshotCopyWithImpl<_RewardsSnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RewardsSnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RewardsSnapshot&&(identical(other.memberName, memberName) || other.memberName == memberName)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.points, points) || other.points == points)&&(identical(other.pointsToNext, pointsToNext) || other.pointsToNext == pointsToNext)&&(identical(other.nextTier, nextTier) || other.nextTier == nextTier)&&(identical(other.tierProgress, tierProgress) || other.tierProgress == tierProgress)&&(identical(other.rewardsBadge, rewardsBadge) || other.rewardsBadge == rewardsBadge)&&const DeepCollectionEquality().equals(other._challenges, _challenges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,memberName,tier,points,pointsToNext,nextTier,tierProgress,rewardsBadge,const DeepCollectionEquality().hash(_challenges));

@override
String toString() {
  return 'RewardsSnapshot(memberName: $memberName, tier: $tier, points: $points, pointsToNext: $pointsToNext, nextTier: $nextTier, tierProgress: $tierProgress, rewardsBadge: $rewardsBadge, challenges: $challenges)';
}


}

/// @nodoc
abstract mixin class _$RewardsSnapshotCopyWith<$Res> implements $RewardsSnapshotCopyWith<$Res> {
  factory _$RewardsSnapshotCopyWith(_RewardsSnapshot value, $Res Function(_RewardsSnapshot) _then) = __$RewardsSnapshotCopyWithImpl;
@override @useResult
$Res call({
 String memberName, String tier, int points, int pointsToNext, String nextTier, double tierProgress, int rewardsBadge, List<Challenge> challenges
});




}
/// @nodoc
class __$RewardsSnapshotCopyWithImpl<$Res>
    implements _$RewardsSnapshotCopyWith<$Res> {
  __$RewardsSnapshotCopyWithImpl(this._self, this._then);

  final _RewardsSnapshot _self;
  final $Res Function(_RewardsSnapshot) _then;

/// Create a copy of RewardsSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? memberName = null,Object? tier = null,Object? points = null,Object? pointsToNext = null,Object? nextTier = null,Object? tierProgress = null,Object? rewardsBadge = null,Object? challenges = null,}) {
  return _then(_RewardsSnapshot(
memberName: null == memberName ? _self.memberName : memberName // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,pointsToNext: null == pointsToNext ? _self.pointsToNext : pointsToNext // ignore: cast_nullable_to_non_nullable
as int,nextTier: null == nextTier ? _self.nextTier : nextTier // ignore: cast_nullable_to_non_nullable
as String,tierProgress: null == tierProgress ? _self.tierProgress : tierProgress // ignore: cast_nullable_to_non_nullable
as double,rewardsBadge: null == rewardsBadge ? _self.rewardsBadge : rewardsBadge // ignore: cast_nullable_to_non_nullable
as int,challenges: null == challenges ? _self._challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<Challenge>,
  ));
}


}

// dart format on
