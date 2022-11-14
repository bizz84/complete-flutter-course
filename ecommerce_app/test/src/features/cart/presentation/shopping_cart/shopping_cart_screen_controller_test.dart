import 'package:ecommerce_app/src/features/cart/application/cart_service.dart';
import 'package:ecommerce_app/src/features/cart/domain/item.dart';
import 'package:ecommerce_app/src/features/cart/presentation/shopping_cart/shopping_cart_screen_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  const productId = '1';

  ProviderContainer makeProviderContainer(MockCartService cartService) {
    final container = ProviderContainer(
      overrides: [
        cartServiceProvider.overrideWithValue(cartService),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('updateItemQuantity', () {
    test('update quantity, success', () async {
      // setup
      const item = Item(productId: productId, quantity: 3);
      final cartService = MockCartService();
      when(() => cartService.setItem(item)).thenAnswer(
        (_) => Future.value(null),
      );
      final container = makeProviderContainer(cartService);
      final controller =
          container.read(shoppingCartScreenControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        shoppingCartScreenControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.updateItemQuantity(productId, 3);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => cartService.setItem(item)).called(1);
    });

    test('update quantity, failure', () async {
      // setup
      const item = Item(productId: productId, quantity: 3);
      final cartService = MockCartService();
      when(() => cartService.setItem(item)).thenThrow(
        (_) => Exception('Connection failed'),
      );
      final container = makeProviderContainer(cartService);
      final controller =
          container.read(shoppingCartScreenControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        shoppingCartScreenControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.updateItemQuantity(productId, 3);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
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
      final container = makeProviderContainer(cartService);
      final controller =
          container.read(shoppingCartScreenControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        shoppingCartScreenControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.removeItemById(productId);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => cartService.removeItemById(productId)).called(1);
    });
    test('remove item, failure', () async {
      // setup
      final cartService = MockCartService();
      when(() => cartService.removeItemById(productId)).thenThrow(
        (_) => Exception('Connection failed'),
      );
      final container = makeProviderContainer(cartService);
      final controller =
          container.read(shoppingCartScreenControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        shoppingCartScreenControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.removeItemById(productId);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => cartService.removeItemById(productId)).called(1);
    });
  });
}
