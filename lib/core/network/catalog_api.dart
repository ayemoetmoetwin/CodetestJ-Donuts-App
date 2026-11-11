import 'dart:convert';

import 'package:jdonuts_app/core/network/api_envelope.dart';

abstract class CatalogApi {
  static const catalogPath = '/v1/catalog';
  static const productsPath = '/v1/products';
  static const bannersPath = '/v1/banners';
  static const shopsPath = '/v1/shops';

  Future<ApiEnvelope> get(String path);
}

class LocalMockCatalogApi implements CatalogApi {
  LocalMockCatalogApi(this._readCatalog, {this.latency = Duration.zero});

  final Future<String> Function() _readCatalog;
  final Duration latency;

  static const _known = {
    CatalogApi.catalogPath,
    CatalogApi.productsPath,
    CatalogApi.bannersPath,
    CatalogApi.shopsPath,
  };

  @override
  Future<ApiEnvelope> get(String path) async {
    final meta = ApiMeta(path: path, version: 'v1');
    if (latency > Duration.zero) {
      await Future<void>.delayed(latency);
    }
    if (!_known.contains(path)) {
      return ApiEnvelope(error: 'not_found', meta: meta);
    }
    try {
      final json = jsonDecode(await _readCatalog()) as Map<String, dynamic>;
      return ApiEnvelope(data: _slice(path, json), meta: meta);
    } on Object {
      return ApiEnvelope(error: 'unavailable', meta: meta);
    }
  }

  Map<String, dynamic> _slice(String path, Map<String, dynamic> json) {
    return switch (path) {
      CatalogApi.productsPath => {'products': json['products']},
      CatalogApi.bannersPath => {'banners': json['banners']},
      CatalogApi.shopsPath => {'shops': json['shops']},
      _ => json,
    };
  }
}
