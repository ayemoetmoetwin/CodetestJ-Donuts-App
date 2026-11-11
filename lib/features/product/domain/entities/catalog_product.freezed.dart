// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CatalogProduct {

 String get id; String get code; String get name; int get priceMmk; bool get isNew; int? get discountPercent; String get imageAsset; String get imageUrl; String get description;
/// Create a copy of CatalogProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogProductCopyWith<CatalogProduct> get copyWith => _$CatalogProductCopyWithImpl<CatalogProduct>(this as CatalogProduct, _$identity);

  /// Serializes this CatalogProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.priceMmk, priceMmk) || other.priceMmk == priceMmk)&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.imageAsset, imageAsset) || other.imageAsset == imageAsset)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,priceMmk,isNew,discountPercent,imageAsset,imageUrl,description);

@override
String toString() {
  return 'CatalogProduct(id: $id, code: $code, name: $name, priceMmk: $priceMmk, isNew: $isNew, discountPercent: $discountPercent, imageAsset: $imageAsset, imageUrl: $imageUrl, description: $description)';
}


}

/// @nodoc
abstract mixin class $CatalogProductCopyWith<$Res>  {
  factory $CatalogProductCopyWith(CatalogProduct value, $Res Function(CatalogProduct) _then) = _$CatalogProductCopyWithImpl;
@useResult
$Res call({
 String id, String code, String name, int priceMmk, bool isNew, int? discountPercent, String imageAsset, String imageUrl, String description
});




}
/// @nodoc
class _$CatalogProductCopyWithImpl<$Res>
    implements $CatalogProductCopyWith<$Res> {
  _$CatalogProductCopyWithImpl(this._self, this._then);

  final CatalogProduct _self;
  final $Res Function(CatalogProduct) _then;

/// Create a copy of CatalogProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? priceMmk = null,Object? isNew = null,Object? discountPercent = freezed,Object? imageAsset = null,Object? imageUrl = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceMmk: null == priceMmk ? _self.priceMmk : priceMmk // ignore: cast_nullable_to_non_nullable
as int,isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as int?,imageAsset: null == imageAsset ? _self.imageAsset : imageAsset // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogProduct].
extension CatalogProductPatterns on CatalogProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogProduct value)  $default,){
final _that = this;
switch (_that) {
case _CatalogProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogProduct value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String name,  int priceMmk,  bool isNew,  int? discountPercent,  String imageAsset,  String imageUrl,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogProduct() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.priceMmk,_that.isNew,_that.discountPercent,_that.imageAsset,_that.imageUrl,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String name,  int priceMmk,  bool isNew,  int? discountPercent,  String imageAsset,  String imageUrl,  String description)  $default,) {final _that = this;
switch (_that) {
case _CatalogProduct():
return $default(_that.id,_that.code,_that.name,_that.priceMmk,_that.isNew,_that.discountPercent,_that.imageAsset,_that.imageUrl,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String name,  int priceMmk,  bool isNew,  int? discountPercent,  String imageAsset,  String imageUrl,  String description)?  $default,) {final _that = this;
switch (_that) {
case _CatalogProduct() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.priceMmk,_that.isNew,_that.discountPercent,_that.imageAsset,_that.imageUrl,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogProduct implements CatalogProduct {
  const _CatalogProduct({required this.id, required this.code, required this.name, required this.priceMmk, required this.isNew, required this.discountPercent, required this.imageAsset, required this.imageUrl, required this.description});
  factory _CatalogProduct.fromJson(Map<String, dynamic> json) => _$CatalogProductFromJson(json);

@override final  String id;
@override final  String code;
@override final  String name;
@override final  int priceMmk;
@override final  bool isNew;
@override final  int? discountPercent;
@override final  String imageAsset;
@override final  String imageUrl;
@override final  String description;

/// Create a copy of CatalogProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogProductCopyWith<_CatalogProduct> get copyWith => __$CatalogProductCopyWithImpl<_CatalogProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.priceMmk, priceMmk) || other.priceMmk == priceMmk)&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.imageAsset, imageAsset) || other.imageAsset == imageAsset)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,priceMmk,isNew,discountPercent,imageAsset,imageUrl,description);

@override
String toString() {
  return 'CatalogProduct(id: $id, code: $code, name: $name, priceMmk: $priceMmk, isNew: $isNew, discountPercent: $discountPercent, imageAsset: $imageAsset, imageUrl: $imageUrl, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CatalogProductCopyWith<$Res> implements $CatalogProductCopyWith<$Res> {
  factory _$CatalogProductCopyWith(_CatalogProduct value, $Res Function(_CatalogProduct) _then) = __$CatalogProductCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String name, int priceMmk, bool isNew, int? discountPercent, String imageAsset, String imageUrl, String description
});




}
/// @nodoc
class __$CatalogProductCopyWithImpl<$Res>
    implements _$CatalogProductCopyWith<$Res> {
  __$CatalogProductCopyWithImpl(this._self, this._then);

  final _CatalogProduct _self;
  final $Res Function(_CatalogProduct) _then;

/// Create a copy of CatalogProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? priceMmk = null,Object? isNew = null,Object? discountPercent = freezed,Object? imageAsset = null,Object? imageUrl = null,Object? description = null,}) {
  return _then(_CatalogProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceMmk: null == priceMmk ? _self.priceMmk : priceMmk // ignore: cast_nullable_to_non_nullable
as int,isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as int?,imageAsset: null == imageAsset ? _self.imageAsset : imageAsset // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
