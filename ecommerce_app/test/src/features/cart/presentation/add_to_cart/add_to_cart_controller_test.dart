import 'package:ecommerce_app/src/features/cart/application/cart_service.dart';
import 'package:ecommerce_app/src/features/cart/domain/item.dart';
import 'package:ecommerce_app/src/features/cart/presentation/add_to_cart/add_to_cart_controller.dart';
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

  group('addItem', () {
    test('item added with quantity = 2, success', () async {
      // setup
      const quantity = 2;
      const item = Item(productId: productId, quantity: quantity);
      final cartService = MockCartService();
      when(() => cartService.addItem(item)).thenAnswer(
        (_) => Future.value(null),
      );
      final container = makeProviderContainer(cartService);
      // add to cart controller
      final addToCartController =
          container.read(addToCartControllerProvider.notifier);
      final addToCartListener = Listener<AsyncValue<void>>();
      container.listen(
        addToCartControllerProvider,
        addToCartListener.call,
        fireImmediately: true,
      );
      // item quantity controller
      final itemQuantityController =
          container.read(itemQuantityControllerProvider.notifier);
      final itemQuantityListener = Listener<int>();
      container.listen(
        itemQuantityControllerProvider,
        itemQuantityListener.call,
        fireImmediately: true,
      );
      // run
      const initialData = AsyncData<void>(null);
      // the build method returns a value immediately, so we expect AsyncData
      verify(() => addToCartListener(null, initialData));
      verify(() => itemQuantityListener(null, 1));
      // update quantity
      itemQuantityController.updateQuantity(quantity);
      // the quantity is updated
      verify(() => itemQuantityListener(1, quantity));
      // add item
      await addToCartController.addItem(productId);
      verifyInOrder(
        [
          // the loading state is set
          () => addToCartListener(
                initialData,
                any(that: isA<AsyncLoading>()),
              ),
          // then the data is set with quantity: 1
          () => addToCartListener(
                any(that: isA<AsyncLoading>()),
                initialData,
              ),
        ],
      );
      // on success, quantity goes back to 1
      verify(() => itemQuantityListener(quantity, 1));
      // then, no more interactions
      verifyNoMoreInteractions(addToCartListener);
      verifyNoMoreInteractions(itemQuantityListener);
      verify(() => cartService.addItem(item)).called(1);
    });

    test('item added with quantity = 2, failure', () async {
      const quantity = 2;
      const item = Item(productId: productId, quantity: quantity);
      final cartService = MockCartService();
      when(() => cartService.addItem(item))
          .thenThrow((_) => Exception('Connection failed'));
      final container = makeProviderContainer(cartService);
      // add to cart controller
      final addToCartController =
          container.read(addToCartControllerProvider.notifier);
      final addToCartListener = Listener<AsyncValue<void>>();
      container.listen(
        addToCartControllerProvider,
        addToCartListener.call,
        fireImmediately: true,
      );
      // item quantity controller
      final itemQuantityController =
          container.read(itemQuantityControllerProvider.notifier);
      final itemQuantityListener = Listener<int>();
      container.listen(
        itemQuantityControllerProvider,
        itemQuantityListener.call,
        fireImmediately: true,
      );
      // run
      const initialData = AsyncData<void>(null);
      // the build method returns a value immediately, so we expect AsyncData
      verify(() => addToCartListener(null, initialData));
      verify(() => itemQuantityListener(null, 1));
      // update quantity
      itemQuantityController.updateQuantity(quantity);
      // the quantity is updated
      verify(() => itemQuantityListener(1, quantity));
      // add item
      await addToCartController.addItem(productId);
      verifyInOrder(
        [
          // the loading state is set
          () => addToCartListener(
                initialData,
                any(that: isA<AsyncLoading>()),
              ),
          // then the data is set with quantity: 1
          () => addToCartListener(
                any(that: isA<AsyncLoading>()),
                any(that: isA<AsyncError>()),
              ),
        ],
      );
      // on error, quantity doesn't change
      // then, no more interactions
      verifyNoMoreInteractions(addToCartListener);
      verifyNoMoreInteractions(itemQuantityListener);
      verify(() => cartService.addItem(item)).called(1);
    });
  });
}
