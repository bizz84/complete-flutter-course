import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/cart/application/cart_service.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('cartTotalProvider', () {
    ProviderContainer makeProviderContainer({
      required AsyncValue<Cart> cart,
      required AsyncValue<List<Product>> products,
    }) {
      final container = ProviderContainer(overrides: [
        cartProvider.overrideWithValue(cart),
        productsListStreamProvider.overrideWithValue(products)
      ]);
      addTearDown(container.dispose);
      return container;
    }

    test('loading cart', () async {
      final container = makeProviderContainer(
        cart: const AsyncLoading(),
        products: const AsyncData(kTestProducts),
      );
      final total = container.read(cartTotalProvider);
      expect(total, 0);
    });

    test('empty cart', () async {
      final container = makeProviderContainer(
        cart: const AsyncData(Cart()),
        products: const AsyncData(kTestProducts),
      );
      final total = container.read(cartTotalProvider);
      expect(total, 0);
    });

    test('one product with quantity = 1', () async {
      final container = makeProviderContainer(
        cart: const AsyncData(Cart({'1': 1})),
        products: const AsyncData(kTestProducts),
      );
      final total = container.read(cartTotalProvider);
      expect(total, 15);
    });

    test('one product with quantity = 5', () async {
      final container = makeProviderContainer(
        cart: const AsyncData(Cart({'1': 5})),
        products: const AsyncData(kTestProducts),
      );
      final total = container.read(cartTotalProvider);
      expect(total, 75);
    });

    test('two products', () async {
      final container = makeProviderContainer(
        cart: const AsyncData(Cart({'1': 2, '2': 3})),
        products: const AsyncData(kTestProducts),
      );
      final total = container.read(cartTotalProvider);
      expect(total, 69); // 15 * 2 + 13 * 3
    });

    test('product not found', () async {
      final container = makeProviderContainer(
        cart: const AsyncData(Cart({'100': 1})),
        products: const AsyncData(kTestProducts),
      );
      expect(() => container.read(cartTotalProvider), throwsStateError);
    });
  });
}
