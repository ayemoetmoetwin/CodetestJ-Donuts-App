// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberProfile {

 String get name; String get tier; int get points; int get pointsToNext; String get nextTier; double get tierProgress; int get notificationCount; int get rewardsBadge; String get photoAsset;
/// Create a copy of MemberProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberProfileCopyWith<MemberProfile> get copyWith => _$MemberProfileCopyWithImpl<MemberProfile>(this as MemberProfile, _$identity);

  /// Serializes this MemberProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.points, points) || other.points == points)&&(identical(other.pointsToNext, pointsToNext) || other.pointsToNext == pointsToNext)&&(identical(other.nextTier, nextTier) || other.nextTier == nextTier)&&(identical(other.tierProgress, tierProgress) || other.tierProgress == tierProgress)&&(identical(other.notificationCount, notificationCount) || other.notificationCount == notificationCount)&&(identical(other.rewardsBadge, rewardsBadge) || other.rewardsBadge == rewardsBadge)&&(identical(other.photoAsset, photoAsset) || other.photoAsset == photoAsset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,tier,points,pointsToNext,nextTier,tierProgress,notificationCount,rewardsBadge,photoAsset);

@override
String toString() {
  return 'MemberProfile(name: $name, tier: $tier, points: $points, pointsToNext: $pointsToNext, nextTier: $nextTier, tierProgress: $tierProgress, notificationCount: $notificationCount, rewardsBadge: $rewardsBadge, photoAsset: $photoAsset)';
}


}

/// @nodoc
abstract mixin class $MemberProfileCopyWith<$Res>  {
  factory $MemberProfileCopyWith(MemberProfile value, $Res Function(MemberProfile) _then) = _$MemberProfileCopyWithImpl;
@useResult
$Res call({
 String name, String tier, int points, int pointsToNext, String nextTier, double tierProgress, int notificationCount, int rewardsBadge, String photoAsset
});




}
/// @nodoc
class _$MemberProfileCopyWithImpl<$Res>
    implements $MemberProfileCopyWith<$Res> {
  _$MemberProfileCopyWithImpl(this._self, this._then);

  final MemberProfile _self;
  final $Res Function(MemberProfile) _then;

/// Create a copy of MemberProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? tier = null,Object? points = null,Object? pointsToNext = null,Object? nextTier = null,Object? tierProgress = null,Object? notificationCount = null,Object? rewardsBadge = null,Object? photoAsset = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,pointsToNext: null == pointsToNext ? _self.pointsToNext : pointsToNext // ignore: cast_nullable_to_non_nullable
as int,nextTier: null == nextTier ? _self.nextTier : nextTier // ignore: cast_nullable_to_non_nullable
as String,tierProgress: null == tierProgress ? _self.tierProgress : tierProgress // ignore: cast_nullable_to_non_nullable
as double,notificationCount: null == notificationCount ? _self.notificationCount : notificationCount // ignore: cast_nullable_to_non_nullable
as int,rewardsBadge: null == rewardsBadge ? _self.rewardsBadge : rewardsBadge // ignore: cast_nullable_to_non_nullable
as int,photoAsset: null == photoAsset ? _self.photoAsset : photoAsset // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MemberProfile].
extension MemberProfilePatterns on MemberProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberProfile value)  $default,){
final _that = this;
switch (_that) {
case _MemberProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberProfile value)?  $default,){
final _that = this;
switch (_that) {
case _MemberProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String tier,  int points,  int pointsToNext,  String nextTier,  double tierProgress,  int notificationCount,  int rewardsBadge,  String photoAsset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberProfile() when $default != null:
return $default(_that.name,_that.tier,_that.points,_that.pointsToNext,_that.nextTier,_that.tierProgress,_that.notificationCount,_that.rewardsBadge,_that.photoAsset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String tier,  int points,  int pointsToNext,  String nextTier,  double tierProgress,  int notificationCount,  int rewardsBadge,  String photoAsset)  $default,) {final _that = this;
switch (_that) {
case _MemberProfile():
return $default(_that.name,_that.tier,_that.points,_that.pointsToNext,_that.nextTier,_that.tierProgress,_that.notificationCount,_that.rewardsBadge,_that.photoAsset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String tier,  int points,  int pointsToNext,  String nextTier,  double tierProgress,  int notificationCount,  int rewardsBadge,  String photoAsset)?  $default,) {final _that = this;
switch (_that) {
case _MemberProfile() when $default != null:
return $default(_that.name,_that.tier,_that.points,_that.pointsToNext,_that.nextTier,_that.tierProgress,_that.notificationCount,_that.rewardsBadge,_that.photoAsset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemberProfile implements MemberProfile {
  const _MemberProfile({required this.name, required this.tier, required this.points, required this.pointsToNext, required this.nextTier, required this.tierProgress, required this.notificationCount, required this.rewardsBadge, required this.photoAsset});
  factory _MemberProfile.fromJson(Map<String, dynamic> json) => _$MemberProfileFromJson(json);

@override final  String name;
@override final  String tier;
@override final  int points;
@override final  int pointsToNext;
@override final  String nextTier;
@override final  double tierProgress;
@override final  int notificationCount;
@override final  int rewardsBadge;
@override final  String photoAsset;

/// Create a copy of MemberProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberProfileCopyWith<_MemberProfile> get copyWith => __$MemberProfileCopyWithImpl<_MemberProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemberProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.points, points) || other.points == points)&&(identical(other.pointsToNext, pointsToNext) || other.pointsToNext == pointsToNext)&&(identical(other.nextTier, nextTier) || other.nextTier == nextTier)&&(identical(other.tierProgress, tierProgress) || other.tierProgress == tierProgress)&&(identical(other.notificationCount, notificationCount) || other.notificationCount == notificationCount)&&(identical(other.rewardsBadge, rewardsBadge) || other.rewardsBadge == rewardsBadge)&&(identical(other.photoAsset, photoAsset) || other.photoAsset == photoAsset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,tier,points,pointsToNext,nextTier,tierProgress,notificationCount,rewardsBadge,photoAsset);

@override
String toString() {
  return 'MemberProfile(name: $name, tier: $tier, points: $points, pointsToNext: $pointsToNext, nextTier: $nextTier, tierProgress: $tierProgress, notificationCount: $notificationCount, rewardsBadge: $rewardsBadge, photoAsset: $photoAsset)';
}


}

/// @nodoc
abstract mixin class _$MemberProfileCopyWith<$Res> implements $MemberProfileCopyWith<$Res> {
  factory _$MemberProfileCopyWith(_MemberProfile value, $Res Function(_MemberProfile) _then) = __$MemberProfileCopyWithImpl;
@override @useResult
$Res call({
 String name, String tier, int points, int pointsToNext, String nextTier, double tierProgress, int notificationCount, int rewardsBadge, String photoAsset
});




}
/// @nodoc
class __$MemberProfileCopyWithImpl<$Res>
    implements _$MemberProfileCopyWith<$Res> {
  __$MemberProfileCopyWithImpl(this._self, this._then);

  final _MemberProfile _self;
  final $Res Function(_MemberProfile) _then;

/// Create a copy of MemberProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? tier = null,Object? points = null,Object? pointsToNext = null,Object? nextTier = null,Object? tierProgress = null,Object? notificationCount = null,Object? rewardsBadge = null,Object? photoAsset = null,}) {
  return _then(_MemberProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,pointsToNext: null == pointsToNext ? _self.pointsToNext : pointsToNext // ignore: cast_nullable_to_non_nullable
as int,nextTier: null == nextTier ? _self.nextTier : nextTier // ignore: cast_nullable_to_non_nullable
as String,tierProgress: null == tierProgress ? _self.tierProgress : tierProgress // ignore: cast_nullable_to_non_nullable
as double,notificationCount: null == notificationCount ? _self.notificationCount : notificationCount // ignore: cast_nullable_to_non_nullable
as int,rewardsBadge: null == rewardsBadge ? _self.rewardsBadge : rewardsBadge // ignore: cast_nullable_to_non_nullable
as int,photoAsset: null == photoAsset ? _self.photoAsset : photoAsset // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PromoBanner {

 String get id; String get title; String get badge; String get imageAsset; String get imageUrl;
/// Create a copy of PromoBanner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromoBannerCopyWith<PromoBanner> get copyWith => _$PromoBannerCopyWithImpl<PromoBanner>(this as PromoBanner, _$identity);

  /// Serializes this PromoBanner to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromoBanner&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.imageAsset, imageAsset) || other.imageAsset == imageAsset)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,badge,imageAsset,imageUrl);

@override
String toString() {
  return 'PromoBanner(id: $id, title: $title, badge: $badge, imageAsset: $imageAsset, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $PromoBannerCopyWith<$Res>  {
  factory $PromoBannerCopyWith(PromoBanner value, $Res Function(PromoBanner) _then) = _$PromoBannerCopyWithImpl;
@useResult
$Res call({
 String id, String title, String badge, String imageAsset, String imageUrl
});




}
/// @nodoc
class _$PromoBannerCopyWithImpl<$Res>
    implements $PromoBannerCopyWith<$Res> {
  _$PromoBannerCopyWithImpl(this._self, this._then);

  final PromoBanner _self;
  final $Res Function(PromoBanner) _then;

/// Create a copy of PromoBanner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? badge = null,Object? imageAsset = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String,imageAsset: null == imageAsset ? _self.imageAsset : imageAsset // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PromoBanner].
extension PromoBannerPatterns on PromoBanner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromoBanner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromoBanner() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromoBanner value)  $default,){
final _that = this;
switch (_that) {
case _PromoBanner():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromoBanner value)?  $default,){
final _that = this;
switch (_that) {
case _PromoBanner() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String badge,  String imageAsset,  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromoBanner() when $default != null:
return $default(_that.id,_that.title,_that.badge,_that.imageAsset,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String badge,  String imageAsset,  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _PromoBanner():
return $default(_that.id,_that.title,_that.badge,_that.imageAsset,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String badge,  String imageAsset,  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _PromoBanner() when $default != null:
return $default(_that.id,_that.title,_that.badge,_that.imageAsset,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromoBanner implements PromoBanner {
  const _PromoBanner({required this.id, required this.title, required this.badge, required this.imageAsset, required this.imageUrl});
  factory _PromoBanner.fromJson(Map<String, dynamic> json) => _$PromoBannerFromJson(json);

@override final  String id;
@override final  String title;
@override final  String badge;
@override final  String imageAsset;
@override final  String imageUrl;

/// Create a copy of PromoBanner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromoBannerCopyWith<_PromoBanner> get copyWith => __$PromoBannerCopyWithImpl<_PromoBanner>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromoBannerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromoBanner&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.imageAsset, imageAsset) || other.imageAsset == imageAsset)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,badge,imageAsset,imageUrl);

@override
String toString() {
  return 'PromoBanner(id: $id, title: $title, badge: $badge, imageAsset: $imageAsset, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$PromoBannerCopyWith<$Res> implements $PromoBannerCopyWith<$Res> {
  factory _$PromoBannerCopyWith(_PromoBanner value, $Res Function(_PromoBanner) _then) = __$PromoBannerCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String badge, String imageAsset, String imageUrl
});




}
/// @nodoc
class __$PromoBannerCopyWithImpl<$Res>
    implements _$PromoBannerCopyWith<$Res> {
  __$PromoBannerCopyWithImpl(this._self, this._then);

  final _PromoBanner _self;
  final $Res Function(_PromoBanner) _then;

/// Create a copy of PromoBanner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? badge = null,Object? imageAsset = null,Object? imageUrl = null,}) {
  return _then(_PromoBanner(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String,imageAsset: null == imageAsset ? _self.imageAsset : imageAsset // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Shop {

 String get id; String get name; String get address; String get distanceLabel; String get imageAsset; String get imageUrl;
/// Create a copy of Shop
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShopCopyWith<Shop> get copyWith => _$ShopCopyWithImpl<Shop>(this as Shop, _$identity);

  /// Serializes this Shop to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shop&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.distanceLabel, distanceLabel) || other.distanceLabel == distanceLabel)&&(identical(other.imageAsset, imageAsset) || other.imageAsset == imageAsset)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,distanceLabel,imageAsset,imageUrl);

@override
String toString() {
  return 'Shop(id: $id, name: $name, address: $address, distanceLabel: $distanceLabel, imageAsset: $imageAsset, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $ShopCopyWith<$Res>  {
  factory $ShopCopyWith(Shop value, $Res Function(Shop) _then) = _$ShopCopyWithImpl;
@useResult
$Res call({
 String id, String name, String address, String distanceLabel, String imageAsset, String imageUrl
});




}
/// @nodoc
class _$ShopCopyWithImpl<$Res>
    implements $ShopCopyWith<$Res> {
  _$ShopCopyWithImpl(this._self, this._then);

  final Shop _self;
  final $Res Function(Shop) _then;

/// Create a copy of Shop
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = null,Object? distanceLabel = null,Object? imageAsset = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,distanceLabel: null == distanceLabel ? _self.distanceLabel : distanceLabel // ignore: cast_nullable_to_non_nullable
as String,imageAsset: null == imageAsset ? _self.imageAsset : imageAsset // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Shop].
extension ShopPatterns on Shop {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Shop value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Shop() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Shop value)  $default,){
final _that = this;
switch (_that) {
case _Shop():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Shop value)?  $default,){
final _that = this;
switch (_that) {
case _Shop() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String address,  String distanceLabel,  String imageAsset,  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Shop() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.distanceLabel,_that.imageAsset,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String address,  String distanceLabel,  String imageAsset,  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _Shop():
return $default(_that.id,_that.name,_that.address,_that.distanceLabel,_that.imageAsset,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String address,  String distanceLabel,  String imageAsset,  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _Shop() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.distanceLabel,_that.imageAsset,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Shop implements Shop {
  const _Shop({required this.id, required this.name, required this.address, required this.distanceLabel, required this.imageAsset, required this.imageUrl});
  factory _Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);

@override final  String id;
@override final  String name;
@override final  String address;
@override final  String distanceLabel;
@override final  String imageAsset;
@override final  String imageUrl;

/// Create a copy of Shop
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShopCopyWith<_Shop> get copyWith => __$ShopCopyWithImpl<_Shop>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShopToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shop&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.distanceLabel, distanceLabel) || other.distanceLabel == distanceLabel)&&(identical(other.imageAsset, imageAsset) || other.imageAsset == imageAsset)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,distanceLabel,imageAsset,imageUrl);

@override
String toString() {
  return 'Shop(id: $id, name: $name, address: $address, distanceLabel: $distanceLabel, imageAsset: $imageAsset, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$ShopCopyWith<$Res> implements $ShopCopyWith<$Res> {
  factory _$ShopCopyWith(_Shop value, $Res Function(_Shop) _then) = __$ShopCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String address, String distanceLabel, String imageAsset, String imageUrl
});




}
/// @nodoc
class __$ShopCopyWithImpl<$Res>
    implements _$ShopCopyWith<$Res> {
  __$ShopCopyWithImpl(this._self, this._then);

  final _Shop _self;
  final $Res Function(_Shop) _then;

/// Create a copy of Shop
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,Object? distanceLabel = null,Object? imageAsset = null,Object? imageUrl = null,}) {
  return _then(_Shop(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,distanceLabel: null == distanceLabel ? _self.distanceLabel : distanceLabel // ignore: cast_nullable_to_non_nullable
as String,imageAsset: null == imageAsset ? _self.imageAsset : imageAsset // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HomeSection {

 String get id; String get title;@ProductListResultConverter() Result<List<CatalogProduct>> get products;
/// Create a copy of HomeSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeSectionCopyWith<HomeSection> get copyWith => _$HomeSectionCopyWithImpl<HomeSection>(this as HomeSection, _$identity);

  /// Serializes this HomeSection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeSection&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.products, products) || other.products == products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,products);

@override
String toString() {
  return 'HomeSection(id: $id, title: $title, products: $products)';
}


}

/// @nodoc
abstract mixin class $HomeSectionCopyWith<$Res>  {
  factory $HomeSectionCopyWith(HomeSection value, $Res Function(HomeSection) _then) = _$HomeSectionCopyWithImpl;
@useResult
$Res call({
 String id, String title,@ProductListResultConverter() Result<List<CatalogProduct>> products
});




}
/// @nodoc
class _$HomeSectionCopyWithImpl<$Res>
    implements $HomeSectionCopyWith<$Res> {
  _$HomeSectionCopyWithImpl(this._self, this._then);

  final HomeSection _self;
  final $Res Function(HomeSection) _then;

/// Create a copy of HomeSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? products = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as Result<List<CatalogProduct>>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeSection].
extension HomeSectionPatterns on HomeSection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeSection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeSection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeSection value)  $default,){
final _that = this;
switch (_that) {
case _HomeSection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeSection value)?  $default,){
final _that = this;
switch (_that) {
case _HomeSection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @ProductListResultConverter()  Result<List<CatalogProduct>> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeSection() when $default != null:
return $default(_that.id,_that.title,_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @ProductListResultConverter()  Result<List<CatalogProduct>> products)  $default,) {final _that = this;
switch (_that) {
case _HomeSection():
return $default(_that.id,_that.title,_that.products);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @ProductListResultConverter()  Result<List<CatalogProduct>> products)?  $default,) {final _that = this;
switch (_that) {
case _HomeSection() when $default != null:
return $default(_that.id,_that.title,_that.products);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeSection implements HomeSection {
  const _HomeSection({required this.id, required this.title, @ProductListResultConverter() required this.products});
  factory _HomeSection.fromJson(Map<String, dynamic> json) => _$HomeSectionFromJson(json);

@override final  String id;
@override final  String title;
@override@ProductListResultConverter() final  Result<List<CatalogProduct>> products;

/// Create a copy of HomeSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeSectionCopyWith<_HomeSection> get copyWith => __$HomeSectionCopyWithImpl<_HomeSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeSectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeSection&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.products, products) || other.products == products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,products);

@override
String toString() {
  return 'HomeSection(id: $id, title: $title, products: $products)';
}


}

/// @nodoc
abstract mixin class _$HomeSectionCopyWith<$Res> implements $HomeSectionCopyWith<$Res> {
  factory _$HomeSectionCopyWith(_HomeSection value, $Res Function(_HomeSection) _then) = __$HomeSectionCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@ProductListResultConverter() Result<List<CatalogProduct>> products
});




}
/// @nodoc
class __$HomeSectionCopyWithImpl<$Res>
    implements _$HomeSectionCopyWith<$Res> {
  __$HomeSectionCopyWithImpl(this._self, this._then);

  final _HomeSection _self;
  final $Res Function(_HomeSection) _then;

/// Create a copy of HomeSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? products = null,}) {
  return _then(_HomeSection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as Result<List<CatalogProduct>>,
  ));
}


}


/// @nodoc
mixin _$HomeSnapshot {

 MemberProfile get member;@BannerListResultConverter() Result<List<PromoBanner>> get banners; List<HomeSection> get sections;@ShopListResultConverter() Result<List<Shop>> get shops;
/// Create a copy of HomeSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeSnapshotCopyWith<HomeSnapshot> get copyWith => _$HomeSnapshotCopyWithImpl<HomeSnapshot>(this as HomeSnapshot, _$identity);

  /// Serializes this HomeSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeSnapshot&&(identical(other.member, member) || other.member == member)&&(identical(other.banners, banners) || other.banners == banners)&&const DeepCollectionEquality().equals(other.sections, sections)&&(identical(other.shops, shops) || other.shops == shops));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,member,banners,const DeepCollectionEquality().hash(sections),shops);

@override
String toString() {
  return 'HomeSnapshot(member: $member, banners: $banners, sections: $sections, shops: $shops)';
}


}

/// @nodoc
abstract mixin class $HomeSnapshotCopyWith<$Res>  {
  factory $HomeSnapshotCopyWith(HomeSnapshot value, $Res Function(HomeSnapshot) _then) = _$HomeSnapshotCopyWithImpl;
@useResult
$Res call({
 MemberProfile member,@BannerListResultConverter() Result<List<PromoBanner>> banners, List<HomeSection> sections,@ShopListResultConverter() Result<List<Shop>> shops
});


$MemberProfileCopyWith<$Res> get member;

}
/// @nodoc
class _$HomeSnapshotCopyWithImpl<$Res>
    implements $HomeSnapshotCopyWith<$Res> {
  _$HomeSnapshotCopyWithImpl(this._self, this._then);

  final HomeSnapshot _self;
  final $Res Function(HomeSnapshot) _then;

/// Create a copy of HomeSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? member = null,Object? banners = null,Object? sections = null,Object? shops = null,}) {
  return _then(_self.copyWith(
member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as MemberProfile,banners: null == banners ? _self.banners : banners // ignore: cast_nullable_to_non_nullable
as Result<List<PromoBanner>>,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<HomeSection>,shops: null == shops ? _self.shops : shops // ignore: cast_nullable_to_non_nullable
as Result<List<Shop>>,
  ));
}
/// Create a copy of HomeSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemberProfileCopyWith<$Res> get member {
  
  return $MemberProfileCopyWith<$Res>(_self.member, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeSnapshot].
extension HomeSnapshotPatterns on HomeSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _HomeSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _HomeSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MemberProfile member, @BannerListResultConverter()  Result<List<PromoBanner>> banners,  List<HomeSection> sections, @ShopListResultConverter()  Result<List<Shop>> shops)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeSnapshot() when $default != null:
return $default(_that.member,_that.banners,_that.sections,_that.shops);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MemberProfile member, @BannerListResultConverter()  Result<List<PromoBanner>> banners,  List<HomeSection> sections, @ShopListResultConverter()  Result<List<Shop>> shops)  $default,) {final _that = this;
switch (_that) {
case _HomeSnapshot():
return $default(_that.member,_that.banners,_that.sections,_that.shops);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MemberProfile member, @BannerListResultConverter()  Result<List<PromoBanner>> banners,  List<HomeSection> sections, @ShopListResultConverter()  Result<List<Shop>> shops)?  $default,) {final _that = this;
switch (_that) {
case _HomeSnapshot() when $default != null:
return $default(_that.member,_that.banners,_that.sections,_that.shops);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeSnapshot implements HomeSnapshot {
  const _HomeSnapshot({required this.member, @BannerListResultConverter() required this.banners, required final  List<HomeSection> sections, @ShopListResultConverter() required this.shops}): _sections = sections;
  factory _HomeSnapshot.fromJson(Map<String, dynamic> json) => _$HomeSnapshotFromJson(json);

@override final  MemberProfile member;
@override@BannerListResultConverter() final  Result<List<PromoBanner>> banners;
 final  List<HomeSection> _sections;
@override List<HomeSection> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}

@override@ShopListResultConverter() final  Result<List<Shop>> shops;

/// Create a copy of HomeSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeSnapshotCopyWith<_HomeSnapshot> get copyWith => __$HomeSnapshotCopyWithImpl<_HomeSnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeSnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeSnapshot&&(identical(other.member, member) || other.member == member)&&(identical(other.banners, banners) || other.banners == banners)&&const DeepCollectionEquality().equals(other._sections, _sections)&&(identical(other.shops, shops) || other.shops == shops));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,member,banners,const DeepCollectionEquality().hash(_sections),shops);

@override
String toString() {
  return 'HomeSnapshot(member: $member, banners: $banners, sections: $sections, shops: $shops)';
}


}

/// @nodoc
abstract mixin class _$HomeSnapshotCopyWith<$Res> implements $HomeSnapshotCopyWith<$Res> {
  factory _$HomeSnapshotCopyWith(_HomeSnapshot value, $Res Function(_HomeSnapshot) _then) = __$HomeSnapshotCopyWithImpl;
@override @useResult
$Res call({
 MemberProfile member,@BannerListResultConverter() Result<List<PromoBanner>> banners, List<HomeSection> sections,@ShopListResultConverter() Result<List<Shop>> shops
});


@override $MemberProfileCopyWith<$Res> get member;

}
/// @nodoc
class __$HomeSnapshotCopyWithImpl<$Res>
    implements _$HomeSnapshotCopyWith<$Res> {
  __$HomeSnapshotCopyWithImpl(this._self, this._then);

  final _HomeSnapshot _self;
  final $Res Function(_HomeSnapshot) _then;

/// Create a copy of HomeSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? member = null,Object? banners = null,Object? sections = null,Object? shops = null,}) {
  return _then(_HomeSnapshot(
member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as MemberProfile,banners: null == banners ? _self.banners : banners // ignore: cast_nullable_to_non_nullable
as Result<List<PromoBanner>>,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<HomeSection>,shops: null == shops ? _self.shops : shops // ignore: cast_nullable_to_non_nullable
as Result<List<Shop>>,
  ));
}

/// Create a copy of HomeSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemberProfileCopyWith<$Res> get member {
  
  return $MemberProfileCopyWith<$Res>(_self.member, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}

// dart format on
