import 'package:ecommerce_app/src/features/cart/domain/item.dart';
import 'package:ecommerce_app/src/features/cart/presentation/shopping_cart/shopping_cart_screen_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  const productId = '1';
  group('updateItemQuantity', () {
    test('update quantity, success', () async {
      // setup
      const item = Item(productId: productId, quantity: 3);
      final cartService = MockCartService();
      when(() => cartService.setItem(item)).thenAnswer(
        (_) => Future.value(null),
      );
      final controller = ShoppingCartScreenController(cartService: cartService);
      // run & verify
      expectLater(
        controller.stream,
        emitsInOrder([
          const AsyncLoading<void>(),
          const AsyncData<void>(null),
        ]),
      );
      await controller.updateItemQuantity(productId, 3);
    });

    test('update quantity, failure', () async {
      // setup
      const item = Item(productId: productId, quantity: 3);
      final cartService = MockCartService();
      when(() => cartService.setItem(item)).thenThrow(
        (_) => Exception('Connection failed'),
      );
      final controller = ShoppingCartScreenController(cartService: cartService);
      // run & verify
      expectLater(
        controller.stream,
        emitsInOrder([
          const AsyncLoading<void>(),
          predicate<AsyncValue<void>>(
            (value) {
              expect(value.hasError, true);
              return true;
            },
          ),
        ]),
      );
      await controller.updateItemQuantity(productId, 3);
      // verify
      verify(() => cartService.setItem(item)).called(1);
    });
  });
  group('removeItemById', () {
    test('remove item, success', () async {
      // setup
      final cartService = MockCartService();
      when(() => cartService.removeItemById(productId)).thenAnswer(
        (_) => Future.value(null),
      );
      final controller = ShoppingCartScreenController(cartService: cartService);
      // run & verify
      expectLater(
        controller.stream,
        emitsInOrder([
          const AsyncLoading<void>(),
          const AsyncData<void>(null),
        ]),
      );
      await controller.removeItemById(productId);
    });
    test('remove item, failure', () async {
      // setup
      final cartService = MockCartService();
      when(() => cartService.removeItemById(productId)).thenThrow(
        (_) => Exception('Connection failed'),
      );
      final controller = ShoppingCartScreenController(cartService: cartService);
      // run & verify
      expectLater(
        controller.stream,
        emitsInOrder([
          const AsyncLoading<void>(),
          predicate<AsyncValue<void>>(
            (value) {
              expect(value.hasError, true);
              return true;
            },
          ),
        ]),
      );
      await controller.removeItemById(productId);
    });
  });
}
