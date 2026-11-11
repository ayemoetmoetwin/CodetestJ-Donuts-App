// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthFlowState {

 AuthMode get mode; String get phone; bool get phoneTouched; AuthBanner get banner; String get otp; int get otpFailures; bool get otpLocked; bool get otpError; int get shake; DateTime? get resendAt; String get firstName; String get lastName; bool get nameTouched; String get month; String get day; String get year; bool get dobTouched; bool get submitting;
/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFlowStateCopyWith<AuthFlowState> get copyWith => _$AuthFlowStateCopyWithImpl<AuthFlowState>(this as AuthFlowState, _$identity);

  /// Serializes this AuthFlowState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFlowState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneTouched, phoneTouched) || other.phoneTouched == phoneTouched)&&(identical(other.banner, banner) || other.banner == banner)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.otpFailures, otpFailures) || other.otpFailures == otpFailures)&&(identical(other.otpLocked, otpLocked) || other.otpLocked == otpLocked)&&(identical(other.otpError, otpError) || other.otpError == otpError)&&(identical(other.shake, shake) || other.shake == shake)&&(identical(other.resendAt, resendAt) || other.resendAt == resendAt)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.nameTouched, nameTouched) || other.nameTouched == nameTouched)&&(identical(other.month, month) || other.month == month)&&(identical(other.day, day) || other.day == day)&&(identical(other.year, year) || other.year == year)&&(identical(other.dobTouched, dobTouched) || other.dobTouched == dobTouched)&&(identical(other.submitting, submitting) || other.submitting == submitting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode,phone,phoneTouched,banner,otp,otpFailures,otpLocked,otpError,shake,resendAt,firstName,lastName,nameTouched,month,day,year,dobTouched,submitting);

@override
String toString() {
  return 'AuthFlowState(mode: $mode, phone: $phone, phoneTouched: $phoneTouched, banner: $banner, otp: $otp, otpFailures: $otpFailures, otpLocked: $otpLocked, otpError: $otpError, shake: $shake, resendAt: $resendAt, firstName: $firstName, lastName: $lastName, nameTouched: $nameTouched, month: $month, day: $day, year: $year, dobTouched: $dobTouched, submitting: $submitting)';
}


}

/// @nodoc
abstract mixin class $AuthFlowStateCopyWith<$Res>  {
  factory $AuthFlowStateCopyWith(AuthFlowState value, $Res Function(AuthFlowState) _then) = _$AuthFlowStateCopyWithImpl;
@useResult
$Res call({
 AuthMode mode, String phone, bool phoneTouched, AuthBanner banner, String otp, int otpFailures, bool otpLocked, bool otpError, int shake, DateTime? resendAt, String firstName, String lastName, bool nameTouched, String month, String day, String year, bool dobTouched, bool submitting
});




}
/// @nodoc
class _$AuthFlowStateCopyWithImpl<$Res>
    implements $AuthFlowStateCopyWith<$Res> {
  _$AuthFlowStateCopyWithImpl(this._self, this._then);

  final AuthFlowState _self;
  final $Res Function(AuthFlowState) _then;

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? phone = null,Object? phoneTouched = null,Object? banner = null,Object? otp = null,Object? otpFailures = null,Object? otpLocked = null,Object? otpError = null,Object? shake = null,Object? resendAt = freezed,Object? firstName = null,Object? lastName = null,Object? nameTouched = null,Object? month = null,Object? day = null,Object? year = null,Object? dobTouched = null,Object? submitting = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AuthMode,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneTouched: null == phoneTouched ? _self.phoneTouched : phoneTouched // ignore: cast_nullable_to_non_nullable
as bool,banner: null == banner ? _self.banner : banner // ignore: cast_nullable_to_non_nullable
as AuthBanner,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,otpFailures: null == otpFailures ? _self.otpFailures : otpFailures // ignore: cast_nullable_to_non_nullable
as int,otpLocked: null == otpLocked ? _self.otpLocked : otpLocked // ignore: cast_nullable_to_non_nullable
as bool,otpError: null == otpError ? _self.otpError : otpError // ignore: cast_nullable_to_non_nullable
as bool,shake: null == shake ? _self.shake : shake // ignore: cast_nullable_to_non_nullable
as int,resendAt: freezed == resendAt ? _self.resendAt : resendAt // ignore: cast_nullable_to_non_nullable
as DateTime?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,nameTouched: null == nameTouched ? _self.nameTouched : nameTouched // ignore: cast_nullable_to_non_nullable
as bool,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,dobTouched: null == dobTouched ? _self.dobTouched : dobTouched // ignore: cast_nullable_to_non_nullable
as bool,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthFlowState].
extension AuthFlowStatePatterns on AuthFlowState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthFlowState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthFlowState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthFlowState value)  $default,){
final _that = this;
switch (_that) {
case _AuthFlowState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthFlowState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthFlowState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthMode mode,  String phone,  bool phoneTouched,  AuthBanner banner,  String otp,  int otpFailures,  bool otpLocked,  bool otpError,  int shake,  DateTime? resendAt,  String firstName,  String lastName,  bool nameTouched,  String month,  String day,  String year,  bool dobTouched,  bool submitting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthFlowState() when $default != null:
return $default(_that.mode,_that.phone,_that.phoneTouched,_that.banner,_that.otp,_that.otpFailures,_that.otpLocked,_that.otpError,_that.shake,_that.resendAt,_that.firstName,_that.lastName,_that.nameTouched,_that.month,_that.day,_that.year,_that.dobTouched,_that.submitting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthMode mode,  String phone,  bool phoneTouched,  AuthBanner banner,  String otp,  int otpFailures,  bool otpLocked,  bool otpError,  int shake,  DateTime? resendAt,  String firstName,  String lastName,  bool nameTouched,  String month,  String day,  String year,  bool dobTouched,  bool submitting)  $default,) {final _that = this;
switch (_that) {
case _AuthFlowState():
return $default(_that.mode,_that.phone,_that.phoneTouched,_that.banner,_that.otp,_that.otpFailures,_that.otpLocked,_that.otpError,_that.shake,_that.resendAt,_that.firstName,_that.lastName,_that.nameTouched,_that.month,_that.day,_that.year,_that.dobTouched,_that.submitting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthMode mode,  String phone,  bool phoneTouched,  AuthBanner banner,  String otp,  int otpFailures,  bool otpLocked,  bool otpError,  int shake,  DateTime? resendAt,  String firstName,  String lastName,  bool nameTouched,  String month,  String day,  String year,  bool dobTouched,  bool submitting)?  $default,) {final _that = this;
switch (_that) {
case _AuthFlowState() when $default != null:
return $default(_that.mode,_that.phone,_that.phoneTouched,_that.banner,_that.otp,_that.otpFailures,_that.otpLocked,_that.otpError,_that.shake,_that.resendAt,_that.firstName,_that.lastName,_that.nameTouched,_that.month,_that.day,_that.year,_that.dobTouched,_that.submitting);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthFlowState extends AuthFlowState {
  const _AuthFlowState({this.mode = AuthMode.register, this.phone = '', this.phoneTouched = false, this.banner = AuthBanner.none, this.otp = '', this.otpFailures = 0, this.otpLocked = false, this.otpError = false, this.shake = 0, this.resendAt, this.firstName = '', this.lastName = '', this.nameTouched = false, this.month = '', this.day = '', this.year = '', this.dobTouched = false, this.submitting = false}): super._();
  factory _AuthFlowState.fromJson(Map<String, dynamic> json) => _$AuthFlowStateFromJson(json);

@override@JsonKey() final  AuthMode mode;
@override@JsonKey() final  String phone;
@override@JsonKey() final  bool phoneTouched;
@override@JsonKey() final  AuthBanner banner;
@override@JsonKey() final  String otp;
@override@JsonKey() final  int otpFailures;
@override@JsonKey() final  bool otpLocked;
@override@JsonKey() final  bool otpError;
@override@JsonKey() final  int shake;
@override final  DateTime? resendAt;
@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override@JsonKey() final  bool nameTouched;
@override@JsonKey() final  String month;
@override@JsonKey() final  String day;
@override@JsonKey() final  String year;
@override@JsonKey() final  bool dobTouched;
@override@JsonKey() final  bool submitting;

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthFlowStateCopyWith<_AuthFlowState> get copyWith => __$AuthFlowStateCopyWithImpl<_AuthFlowState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthFlowStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthFlowState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneTouched, phoneTouched) || other.phoneTouched == phoneTouched)&&(identical(other.banner, banner) || other.banner == banner)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.otpFailures, otpFailures) || other.otpFailures == otpFailures)&&(identical(other.otpLocked, otpLocked) || other.otpLocked == otpLocked)&&(identical(other.otpError, otpError) || other.otpError == otpError)&&(identical(other.shake, shake) || other.shake == shake)&&(identical(other.resendAt, resendAt) || other.resendAt == resendAt)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.nameTouched, nameTouched) || other.nameTouched == nameTouched)&&(identical(other.month, month) || other.month == month)&&(identical(other.day, day) || other.day == day)&&(identical(other.year, year) || other.year == year)&&(identical(other.dobTouched, dobTouched) || other.dobTouched == dobTouched)&&(identical(other.submitting, submitting) || other.submitting == submitting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode,phone,phoneTouched,banner,otp,otpFailures,otpLocked,otpError,shake,resendAt,firstName,lastName,nameTouched,month,day,year,dobTouched,submitting);

@override
String toString() {
  return 'AuthFlowState(mode: $mode, phone: $phone, phoneTouched: $phoneTouched, banner: $banner, otp: $otp, otpFailures: $otpFailures, otpLocked: $otpLocked, otpError: $otpError, shake: $shake, resendAt: $resendAt, firstName: $firstName, lastName: $lastName, nameTouched: $nameTouched, month: $month, day: $day, year: $year, dobTouched: $dobTouched, submitting: $submitting)';
}


}

/// @nodoc
abstract mixin class _$AuthFlowStateCopyWith<$Res> implements $AuthFlowStateCopyWith<$Res> {
  factory _$AuthFlowStateCopyWith(_AuthFlowState value, $Res Function(_AuthFlowState) _then) = __$AuthFlowStateCopyWithImpl;
@override @useResult
$Res call({
 AuthMode mode, String phone, bool phoneTouched, AuthBanner banner, String otp, int otpFailures, bool otpLocked, bool otpError, int shake, DateTime? resendAt, String firstName, String lastName, bool nameTouched, String month, String day, String year, bool dobTouched, bool submitting
});




}
/// @nodoc
class __$AuthFlowStateCopyWithImpl<$Res>
    implements _$AuthFlowStateCopyWith<$Res> {
  __$AuthFlowStateCopyWithImpl(this._self, this._then);

  final _AuthFlowState _self;
  final $Res Function(_AuthFlowState) _then;

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? phone = null,Object? phoneTouched = null,Object? banner = null,Object? otp = null,Object? otpFailures = null,Object? otpLocked = null,Object? otpError = null,Object? shake = null,Object? resendAt = freezed,Object? firstName = null,Object? lastName = null,Object? nameTouched = null,Object? month = null,Object? day = null,Object? year = null,Object? dobTouched = null,Object? submitting = null,}) {
  return _then(_AuthFlowState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AuthMode,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneTouched: null == phoneTouched ? _self.phoneTouched : phoneTouched // ignore: cast_nullable_to_non_nullable
as bool,banner: null == banner ? _self.banner : banner // ignore: cast_nullable_to_non_nullable
as AuthBanner,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,otpFailures: null == otpFailures ? _self.otpFailures : otpFailures // ignore: cast_nullable_to_non_nullable
as int,otpLocked: null == otpLocked ? _self.otpLocked : otpLocked // ignore: cast_nullable_to_non_nullable
as bool,otpError: null == otpError ? _self.otpError : otpError // ignore: cast_nullable_to_non_nullable
as bool,shake: null == shake ? _self.shake : shake // ignore: cast_nullable_to_non_nullable
as int,resendAt: freezed == resendAt ? _self.resendAt : resendAt // ignore: cast_nullable_to_non_nullable
as DateTime?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,nameTouched: null == nameTouched ? _self.nameTouched : nameTouched // ignore: cast_nullable_to_non_nullable
as bool,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,dobTouched: null == dobTouched ? _self.dobTouched : dobTouched // ignore: cast_nullable_to_non_nullable
as bool,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
