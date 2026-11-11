// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_standing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberStanding {

 String get tier; String get nextTier; int get pointsToNext; double get progress;
/// Create a copy of MemberStanding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberStandingCopyWith<MemberStanding> get copyWith => _$MemberStandingCopyWithImpl<MemberStanding>(this as MemberStanding, _$identity);

  /// Serializes this MemberStanding to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberStanding&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.nextTier, nextTier) || other.nextTier == nextTier)&&(identical(other.pointsToNext, pointsToNext) || other.pointsToNext == pointsToNext)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tier,nextTier,pointsToNext,progress);

@override
String toString() {
  return 'MemberStanding(tier: $tier, nextTier: $nextTier, pointsToNext: $pointsToNext, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $MemberStandingCopyWith<$Res>  {
  factory $MemberStandingCopyWith(MemberStanding value, $Res Function(MemberStanding) _then) = _$MemberStandingCopyWithImpl;
@useResult
$Res call({
 String tier, String nextTier, int pointsToNext, double progress
});




}
/// @nodoc
class _$MemberStandingCopyWithImpl<$Res>
    implements $MemberStandingCopyWith<$Res> {
  _$MemberStandingCopyWithImpl(this._self, this._then);

  final MemberStanding _self;
  final $Res Function(MemberStanding) _then;

/// Create a copy of MemberStanding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tier = null,Object? nextTier = null,Object? pointsToNext = null,Object? progress = null,}) {
  return _then(_self.copyWith(
tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,nextTier: null == nextTier ? _self.nextTier : nextTier // ignore: cast_nullable_to_non_nullable
as String,pointsToNext: null == pointsToNext ? _self.pointsToNext : pointsToNext // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MemberStanding].
extension MemberStandingPatterns on MemberStanding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberStanding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberStanding() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberStanding value)  $default,){
final _that = this;
switch (_that) {
case _MemberStanding():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberStanding value)?  $default,){
final _that = this;
switch (_that) {
case _MemberStanding() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tier,  String nextTier,  int pointsToNext,  double progress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberStanding() when $default != null:
return $default(_that.tier,_that.nextTier,_that.pointsToNext,_that.progress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tier,  String nextTier,  int pointsToNext,  double progress)  $default,) {final _that = this;
switch (_that) {
case _MemberStanding():
return $default(_that.tier,_that.nextTier,_that.pointsToNext,_that.progress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tier,  String nextTier,  int pointsToNext,  double progress)?  $default,) {final _that = this;
switch (_that) {
case _MemberStanding() when $default != null:
return $default(_that.tier,_that.nextTier,_that.pointsToNext,_that.progress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemberStanding extends MemberStanding {
  const _MemberStanding({required this.tier, required this.nextTier, required this.pointsToNext, required this.progress}): super._();
  factory _MemberStanding.fromJson(Map<String, dynamic> json) => _$MemberStandingFromJson(json);

@override final  String tier;
@override final  String nextTier;
@override final  int pointsToNext;
@override final  double progress;

/// Create a copy of MemberStanding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberStandingCopyWith<_MemberStanding> get copyWith => __$MemberStandingCopyWithImpl<_MemberStanding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemberStandingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberStanding&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.nextTier, nextTier) || other.nextTier == nextTier)&&(identical(other.pointsToNext, pointsToNext) || other.pointsToNext == pointsToNext)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tier,nextTier,pointsToNext,progress);

@override
String toString() {
  return 'MemberStanding(tier: $tier, nextTier: $nextTier, pointsToNext: $pointsToNext, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$MemberStandingCopyWith<$Res> implements $MemberStandingCopyWith<$Res> {
  factory _$MemberStandingCopyWith(_MemberStanding value, $Res Function(_MemberStanding) _then) = __$MemberStandingCopyWithImpl;
@override @useResult
$Res call({
 String tier, String nextTier, int pointsToNext, double progress
});




}
/// @nodoc
class __$MemberStandingCopyWithImpl<$Res>
    implements _$MemberStandingCopyWith<$Res> {
  __$MemberStandingCopyWithImpl(this._self, this._then);

  final _MemberStanding _self;
  final $Res Function(_MemberStanding) _then;

/// Create a copy of MemberStanding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tier = null,Object? nextTier = null,Object? pointsToNext = null,Object? progress = null,}) {
  return _then(_MemberStanding(
tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,nextTier: null == nextTier ? _self.nextTier : nextTier // ignore: cast_nullable_to_non_nullable
as String,pointsToNext: null == pointsToNext ? _self.pointsToNext : pointsToNext // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
