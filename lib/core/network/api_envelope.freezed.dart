// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_envelope.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiMeta {

 String get path; String get version;
/// Create a copy of ApiMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiMetaCopyWith<ApiMeta> get copyWith => _$ApiMetaCopyWithImpl<ApiMeta>(this as ApiMeta, _$identity);

  /// Serializes this ApiMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiMeta&&(identical(other.path, path) || other.path == path)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,version);

@override
String toString() {
  return 'ApiMeta(path: $path, version: $version)';
}


}

/// @nodoc
abstract mixin class $ApiMetaCopyWith<$Res>  {
  factory $ApiMetaCopyWith(ApiMeta value, $Res Function(ApiMeta) _then) = _$ApiMetaCopyWithImpl;
@useResult
$Res call({
 String path, String version
});




}
/// @nodoc
class _$ApiMetaCopyWithImpl<$Res>
    implements $ApiMetaCopyWith<$Res> {
  _$ApiMetaCopyWithImpl(this._self, this._then);

  final ApiMeta _self;
  final $Res Function(ApiMeta) _then;

/// Create a copy of ApiMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? version = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiMeta].
extension ApiMetaPatterns on ApiMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiMeta value)  $default,){
final _that = this;
switch (_that) {
case _ApiMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiMeta value)?  $default,){
final _that = this;
switch (_that) {
case _ApiMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path,  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiMeta() when $default != null:
return $default(_that.path,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path,  String version)  $default,) {final _that = this;
switch (_that) {
case _ApiMeta():
return $default(_that.path,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path,  String version)?  $default,) {final _that = this;
switch (_that) {
case _ApiMeta() when $default != null:
return $default(_that.path,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiMeta implements ApiMeta {
  const _ApiMeta({required this.path, required this.version});
  factory _ApiMeta.fromJson(Map<String, dynamic> json) => _$ApiMetaFromJson(json);

@override final  String path;
@override final  String version;

/// Create a copy of ApiMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiMetaCopyWith<_ApiMeta> get copyWith => __$ApiMetaCopyWithImpl<_ApiMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiMeta&&(identical(other.path, path) || other.path == path)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,version);

@override
String toString() {
  return 'ApiMeta(path: $path, version: $version)';
}


}

/// @nodoc
abstract mixin class _$ApiMetaCopyWith<$Res> implements $ApiMetaCopyWith<$Res> {
  factory _$ApiMetaCopyWith(_ApiMeta value, $Res Function(_ApiMeta) _then) = __$ApiMetaCopyWithImpl;
@override @useResult
$Res call({
 String path, String version
});




}
/// @nodoc
class __$ApiMetaCopyWithImpl<$Res>
    implements _$ApiMetaCopyWith<$Res> {
  __$ApiMetaCopyWithImpl(this._self, this._then);

  final _ApiMeta _self;
  final $Res Function(_ApiMeta) _then;

/// Create a copy of ApiMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? version = null,}) {
  return _then(_ApiMeta(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ApiEnvelope {

 ApiMeta get meta; Map<String, dynamic>? get data; String? get error;
/// Create a copy of ApiEnvelope
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiEnvelopeCopyWith<ApiEnvelope> get copyWith => _$ApiEnvelopeCopyWithImpl<ApiEnvelope>(this as ApiEnvelope, _$identity);

  /// Serializes this ApiEnvelope to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiEnvelope&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(data),error);

@override
String toString() {
  return 'ApiEnvelope(meta: $meta, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class $ApiEnvelopeCopyWith<$Res>  {
  factory $ApiEnvelopeCopyWith(ApiEnvelope value, $Res Function(ApiEnvelope) _then) = _$ApiEnvelopeCopyWithImpl;
@useResult
$Res call({
 ApiMeta meta, Map<String, dynamic>? data, String? error
});


$ApiMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$ApiEnvelopeCopyWithImpl<$Res>
    implements $ApiEnvelopeCopyWith<$Res> {
  _$ApiEnvelopeCopyWithImpl(this._self, this._then);

  final ApiEnvelope _self;
  final $Res Function(ApiEnvelope) _then;

/// Create a copy of ApiEnvelope
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meta = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiMeta,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ApiEnvelope
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiMetaCopyWith<$Res> get meta {
  
  return $ApiMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApiEnvelope].
extension ApiEnvelopePatterns on ApiEnvelope {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiEnvelope value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiEnvelope() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiEnvelope value)  $default,){
final _that = this;
switch (_that) {
case _ApiEnvelope():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiEnvelope value)?  $default,){
final _that = this;
switch (_that) {
case _ApiEnvelope() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ApiMeta meta,  Map<String, dynamic>? data,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiEnvelope() when $default != null:
return $default(_that.meta,_that.data,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ApiMeta meta,  Map<String, dynamic>? data,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ApiEnvelope():
return $default(_that.meta,_that.data,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ApiMeta meta,  Map<String, dynamic>? data,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ApiEnvelope() when $default != null:
return $default(_that.meta,_that.data,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiEnvelope extends ApiEnvelope {
  const _ApiEnvelope({required this.meta, final  Map<String, dynamic>? data, this.error}): _data = data,super._();
  factory _ApiEnvelope.fromJson(Map<String, dynamic> json) => _$ApiEnvelopeFromJson(json);

@override final  ApiMeta meta;
 final  Map<String, dynamic>? _data;
@override Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? error;

/// Create a copy of ApiEnvelope
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiEnvelopeCopyWith<_ApiEnvelope> get copyWith => __$ApiEnvelopeCopyWithImpl<_ApiEnvelope>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiEnvelopeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiEnvelope&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(_data),error);

@override
String toString() {
  return 'ApiEnvelope(meta: $meta, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ApiEnvelopeCopyWith<$Res> implements $ApiEnvelopeCopyWith<$Res> {
  factory _$ApiEnvelopeCopyWith(_ApiEnvelope value, $Res Function(_ApiEnvelope) _then) = __$ApiEnvelopeCopyWithImpl;
@override @useResult
$Res call({
 ApiMeta meta, Map<String, dynamic>? data, String? error
});


@override $ApiMetaCopyWith<$Res> get meta;

}
/// @nodoc
class __$ApiEnvelopeCopyWithImpl<$Res>
    implements _$ApiEnvelopeCopyWith<$Res> {
  __$ApiEnvelopeCopyWithImpl(this._self, this._then);

  final _ApiEnvelope _self;
  final $Res Function(_ApiEnvelope) _then;

/// Create a copy of ApiEnvelope
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meta = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_ApiEnvelope(
meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiMeta,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ApiEnvelope
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiMetaCopyWith<$Res> get meta {
  
  return $ApiMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on
