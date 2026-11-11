// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemberProfile _$MemberProfileFromJson(Map<String, dynamic> json) =>
    _MemberProfile(
      name: json['name'] as String,
      tier: json['tier'] as String,
      points: (json['points'] as num).toInt(),
      pointsToNext: (json['pointsToNext'] as num).toInt(),
      nextTier: json['nextTier'] as String,
      tierProgress: (json['tierProgress'] as num).toDouble(),
      notificationCount: (json['notificationCount'] as num).toInt(),
      rewardsBadge: (json['rewardsBadge'] as num).toInt(),
      photoAsset: json['photoAsset'] as String,
    );

Map<String, dynamic> _$MemberProfileToJson(_MemberProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tier': instance.tier,
      'points': instance.points,
      'pointsToNext': instance.pointsToNext,
      'nextTier': instance.nextTier,
      'tierProgress': instance.tierProgress,
      'notificationCount': instance.notificationCount,
      'rewardsBadge': instance.rewardsBadge,
      'photoAsset': instance.photoAsset,
    };

_PromoBanner _$PromoBannerFromJson(Map<String, dynamic> json) => _PromoBanner(
  id: json['id'] as String,
  title: json['title'] as String,
  badge: json['badge'] as String,
  imageAsset: json['imageAsset'] as String,
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$PromoBannerToJson(_PromoBanner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'badge': instance.badge,
      'imageAsset': instance.imageAsset,
      'imageUrl': instance.imageUrl,
    };

_Shop _$ShopFromJson(Map<String, dynamic> json) => _Shop(
  id: json['id'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  distanceLabel: json['distanceLabel'] as String,
  imageAsset: json['imageAsset'] as String,
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$ShopToJson(_Shop instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'distanceLabel': instance.distanceLabel,
  'imageAsset': instance.imageAsset,
  'imageUrl': instance.imageUrl,
};

_HomeSection _$HomeSectionFromJson(Map<String, dynamic> json) => _HomeSection(
  id: json['id'] as String,
  title: json['title'] as String,
  products: const ProductListResultConverter().fromJson(
    json['products'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$HomeSectionToJson(_HomeSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'products': const ProductListResultConverter().toJson(instance.products),
    };

_HomeSnapshot _$HomeSnapshotFromJson(Map<String, dynamic> json) =>
    _HomeSnapshot(
      member: MemberProfile.fromJson(json['member'] as Map<String, dynamic>),
      banners: const BannerListResultConverter().fromJson(
        json['banners'] as Map<String, dynamic>,
      ),
      sections: (json['sections'] as List<dynamic>)
          .map((e) => HomeSection.fromJson(e as Map<String, dynamic>))
          .toList(),
      shops: const ShopListResultConverter().fromJson(
        json['shops'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$HomeSnapshotToJson(_HomeSnapshot instance) =>
    <String, dynamic>{
      'member': instance.member.toJson(),
      'banners': const BannerListResultConverter().toJson(instance.banners),
      'sections': instance.sections.map((e) => e.toJson()).toList(),
      'shops': const ShopListResultConverter().toJson(instance.shops),
    };
