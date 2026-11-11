import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    required this.asset,
    required this.url,
    this.heroTag,
    this.fit = BoxFit.cover,
    super.key,
  });

  final String asset;
  final String url;
  final String? heroTag;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final image = url.isEmpty ? _asset() : _cached();
    if (heroTag == null) {
      return image;
    }
    return Hero(
      tag: heroTag!,
      child: Material(color: AppColors.surface, child: image),
    );
  }

  Widget _asset() => Image.asset(asset, fit: fit);

  Widget _cached() {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      fadeInDuration: const Duration(milliseconds: 180),
      placeholder: (_, _) => _asset(),
      errorWidget: (_, _, _) => _asset(),
    );
  }
}
