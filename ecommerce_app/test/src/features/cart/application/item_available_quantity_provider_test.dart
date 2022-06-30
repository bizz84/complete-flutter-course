import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/cart/application/cart_service.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('itemAvailableQuantityProvider', () {
    ProviderContainer makeProviderContainer({
      required AsyncValue<Cart> cart,
    }) {
      final container = ProviderContainer(overrides: [
        cartProvider.overrideWithValue(cart),
      ]);
      addTearDown(container.dispose);
      return container;
    }

    test('loading cart', () async {
      final container = makeProviderContainer(
        cart: const AsyncLoading(),
      );
      final availableQuantity =
          container.read(itemAvailableQuantityProvider(kTestProducts[0]));
      expect(availableQuantity, 5);
    });

    test('empty cart', () async {
      final container = makeProviderContainer(
        cart: const AsyncData(Cart()),
      );
      final availableQuantity =
          container.read(itemAvailableQuantityProvider(kTestProducts[0]));
      expect(availableQuantity, 5);
    });

    test('product with quantity = 1', () async {
      final container = makeProviderContainer(
        cart: const AsyncData(Cart({'1': 1})),
      );
      final availableQuantity =
          container.read(itemAvailableQuantityProvider(kTestProducts[0]));
      expect(availableQuantity, 4);
    });

    test('product with quantity = 5', () async {
      final container = makeProviderContainer(
        cart: const AsyncData(Cart({'1': 5})),
      );
      final availableQuantity =
          container.read(itemAvailableQuantityProvider(kTestProducts[0]));
      expect(availableQuantity, 0);
    });

    test('product with quantity = 10', () async {
      final container = makeProviderContainer(
        cart: const AsyncData(Cart({'1': 10})),
      );
      final availableQuantity =
          container.read(itemAvailableQuantityProvider(kTestProducts[0]));
      expect(availableQuantity, 0);
    });
  });
}
