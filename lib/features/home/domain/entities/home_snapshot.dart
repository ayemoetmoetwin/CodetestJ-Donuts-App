import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jdonuts_app/core/failure/app_failure.dart';
import 'package:jdonuts_app/core/result/result.dart';
import 'package:jdonuts_app/features/product/domain/entities/catalog_product.dart';

part 'home_snapshot.freezed.dart';
part 'home_snapshot.g.dart';

class ProductListResultConverter
    implements
        JsonConverter<Result<List<CatalogProduct>>, Map<String, dynamic>> {
  const ProductListResultConverter();

  @override
  Result<List<CatalogProduct>> fromJson(Map<String, dynamic> json) {
    return _read(json, CatalogProduct.fromJson);
  }

  @override
  Map<String, dynamic> toJson(Result<List<CatalogProduct>> object) {
    return _write(object, (item) => item.toJson());
  }
}

class BannerListResultConverter
    implements JsonConverter<Result<List<PromoBanner>>, Map<String, dynamic>> {
  const BannerListResultConverter();

  @override
  Result<List<PromoBanner>> fromJson(Map<String, dynamic> json) {
    return _read(json, PromoBanner.fromJson);
  }

  @override
  Map<String, dynamic> toJson(Result<List<PromoBanner>> object) {
    return _write(object, (item) => item.toJson());
  }
}

class ShopListResultConverter
    implements JsonConverter<Result<List<Shop>>, Map<String, dynamic>> {
  const ShopListResultConverter();

  @override
  Result<List<Shop>> fromJson(Map<String, dynamic> json) {
    return _read(json, Shop.fromJson);
  }

  @override
  Map<String, dynamic> toJson(Result<List<Shop>> object) {
    return _write(object, (item) => item.toJson());
  }
}

Result<List<T>> _read<T>(
  Map<String, dynamic> json,
  T Function(Map<String, dynamic> json) decode,
) {
  final code = json['error'] as String?;
  if (code != null) {
    return Failure(_failure(code));
  }
  final rows = (json['value'] as List<dynamic>? ?? const <dynamic>[])
      .map((row) => decode(row as Map<String, dynamic>))
      .toList();
  return Success(rows);
}

Map<String, dynamic> _write<T>(
  Result<List<T>> result,
  Map<String, dynamic> Function(T item) encode,
) {
  return result.when(
    success: (value) => {'value': value.map(encode).toList()},
    failure: (failure) => {'error': failure.code},
  );
}

AppFailure _failure(String code) {
  return switch (code) {
    'offline' => const OfflineFailure(),
    'notFound' => const NotFoundFailure(),
    _ => DatabaseFailure(code),
  };
}

@freezed
abstract class MemberProfile with _$MemberProfile {
  const factory MemberProfile({
    required String name,
    required String tier,
    required int points,
    required int pointsToNext,
    required String nextTier,
    required double tierProgress,
    required int notificationCount,
    required int rewardsBadge,
    required String photoAsset,
  }) = _MemberProfile;

  factory MemberProfile.fromJson(Map<String, dynamic> json) =>
      _$MemberProfileFromJson(json);
}

@freezed
abstract class PromoBanner with _$PromoBanner {
  const factory PromoBanner({
    required String id,
    required String title,
    required String badge,
    required String imageAsset,
    required String imageUrl,
  }) = _PromoBanner;

  factory PromoBanner.fromJson(Map<String, dynamic> json) =>
      _$PromoBannerFromJson(json);
}

@freezed
abstract class Shop with _$Shop {
  const factory Shop({
    required String id,
    required String name,
    required String address,
    required String distanceLabel,
    required String imageAsset,
    required String imageUrl,
  }) = _Shop;

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
}

@freezed
abstract class HomeSection with _$HomeSection {
  const factory HomeSection({
    required String id,
    required String title,
    @ProductListResultConverter()
    required Result<List<CatalogProduct>> products,
  }) = _HomeSection;

  factory HomeSection.fromJson(Map<String, dynamic> json) =>
      _$HomeSectionFromJson(json);
}

@freezed
abstract class HomeSnapshot with _$HomeSnapshot {
  const factory HomeSnapshot({
    required MemberProfile member,
    @BannerListResultConverter() required Result<List<PromoBanner>> banners,
    required List<HomeSection> sections,
    @ShopListResultConverter() required Result<List<Shop>> shops,
  }) = _HomeSnapshot;

  factory HomeSnapshot.fromJson(Map<String, dynamic> json) =>
      _$HomeSnapshotFromJson(json);
}
