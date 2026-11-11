import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts_app/core/database/app_database.dart';
import 'package:jdonuts_app/core/database/tables.dart';
import 'package:jdonuts_app/core/result/result.dart';
import 'package:jdonuts_app/features/cart/data/cart_repository_impl.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'adding the same product keeps one line and adds the quantity',
    () async {
      final database = AppDatabase(NativeDatabase.memory());
      addTearDown(database.close);
      await database
          .into(database.products)
          .insert(
            ProductsCompanion.insert(
              id: 'p_coconut',
              code: 'JD022123',
              name: 'Coconut Donut',
              priceMmk: 3200,
              imageAsset: 'assets/images/product_coconut_cutout.png',
              description: 'A coconut donut',
            ),
          );
      final cart = CartRepositoryImpl(database);

      final first = await cart.add('p_coconut', 2);
      final second = await cart.add('p_coconut', 1);
      expect(first, isA<Success>());
      expect(second, isA<Success>());

      final loaded = await cart.load();
      loaded.when(
        success: (lines) {
          expect(lines, hasLength(1));
          expect(lines.single.quantity, 3);
          expect(lines.single.lineTotal, 9600);
        },
        failure: (error) => fail(error.code),
      );

      await cart.setQuantity('p_coconut', 0);
      final empty = await cart.load();
      empty.when(
        success: (lines) => expect(lines, isEmpty),
        failure: (error) => fail(error.code),
      );
    },
  );

  test('checkout puts the cart items at the front of order again', () async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    await database
        .into(database.products)
        .insert(
          ProductsCompanion.insert(
            id: 'p_coconut',
            code: 'JD022123',
            name: 'Coconut Donut',
            priceMmk: 3200,
            imageAsset: 'assets/images/product_coconut_cutout.png',
            description: 'A coconut donut',
          ),
        );
    await database
        .into(database.sections)
        .insert(
          SectionsCompanion.insert(
            id: orderAgainSectionId,
            title: 'Order again',
            position: 2,
          ),
        );
    await database
        .into(database.sectionProducts)
        .insert(
          SectionProductsCompanion.insert(
            sectionId: orderAgainSectionId,
            productId: 'p_santa',
            position: 0,
          ),
        );
    final cart = CartRepositoryImpl(database);
    await cart.add('p_coconut', 2);

    final placed = await cart.checkout();
    expect(placed, isA<Success<void>>());

    final again =
        await (database.select(database.sectionProducts)
              ..where((row) => row.sectionId.equals(orderAgainSectionId))
              ..orderBy([(row) => OrderingTerm.asc(row.position)]))
            .get();
    expect(again.map((row) => row.productId).toList(), [
      'p_coconut',
      'p_santa',
    ]);
    final loaded = await cart.load();
    loaded.when(
      success: (lines) => expect(lines, isEmpty),
      failure: (error) => fail(error.code),
    );
  });
}
