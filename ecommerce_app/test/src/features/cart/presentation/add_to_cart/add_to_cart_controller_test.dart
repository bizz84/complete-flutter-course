import 'package:ecommerce_app/src/features/cart/domain/item.dart';
import 'package:ecommerce_app/src/features/cart/presentation/add_to_cart/add_to_cart_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  const productId = '1';
  group('addItem', () {
    test('item added with quantity = 2, success', () async {
      // setup
      const quantity = 2;
      const item = Item(productId: productId, quantity: quantity);
      final cartService = MockCartService();
      when(() => cartService.addItem(item)).thenAnswer(
        (_) => Future.value(null),
      );
      // run & verify
      final controller = AddToCartController(cartService: cartService);
      expect(
        controller.state,
        const AsyncData(1),
      );
      controller.updateQuantity(quantity);
      expect(
        controller.state,
        const AsyncData(2),
      );
      // * if desired, use expectLater and emitsInOrder here to check that
      // * addItems emits two values
      await controller.addItem(productId);
      verify(() => cartService.addItem(item)).called(1);
      // check that quantity goes back to 1 after adding an item
      expect(
        controller.state,
        const AsyncData(1),
      );
    });

    test('item added with quantity = 2, failure', () async {
      const quantity = 2;
      const item = Item(productId: productId, quantity: quantity);
      final cartService = MockCartService();
      when(() => cartService.addItem(item))
          .thenThrow((_) => Exception('Connection failed'));
      final controller = AddToCartController(cartService: cartService);
      expect(
        controller.state,
        const AsyncData(1),
      );
      controller.updateQuantity(quantity);
      expect(
        controller.state,
        const AsyncData(2),
      );
      // * if desired, use expectLater and emitsInOrder here to check that
      // * addItems emits two values
      await controller.addItem(productId);
      verify(() => cartService.addItem(item)).called(1);
      // check that quantity goes back to 1 after adding an item
      expect(
        controller.state,
        predicate<AsyncValue<int>>(
          (value) {
            expect(value.hasError, true);
            return true;
          },
        ),
      );
    });
  });
}
