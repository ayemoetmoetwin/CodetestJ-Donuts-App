import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts_app/core/network/catalog_api.dart';

void main() {
  const raw = '{"products": [], "banners": [1], "shops": [2]}';

  test('catalog response uses the data error meta envelope', () async {
    final api = LocalMockCatalogApi(() async => raw);
    final response = await api.get(CatalogApi.catalogPath);

    expect(response.error, isNull);
    expect(response.ok, isTrue);
    expect(response.data?['banners'], [1]);
    expect(response.meta.path, '/v1/catalog');
    expect(response.meta.version, 'v1');
  });

  test('versioned paths return only their slice', () async {
    final api = LocalMockCatalogApi(() async => raw);
    final products = await api.get(CatalogApi.productsPath);
    final shops = await api.get(CatalogApi.shopsPath);

    expect(products.data?.keys, ['products']);
    expect(shops.data?['shops'], [2]);
  });

  test('an unknown path returns an error and no data', () async {
    final api = LocalMockCatalogApi(() async => raw);
    final response = await api.get('/v2/catalog');

    expect(response.data, isNull);
    expect(response.error, 'not_found');
    expect(response.ok, isFalse);
  });

  test('a broken payload becomes an error envelope', () async {
    final api = LocalMockCatalogApi(() async => 'not-json');
    final response = await api.get(CatalogApi.bannersPath);

    expect(response.data, isNull);
    expect(response.error, 'unavailable');
  });
}
