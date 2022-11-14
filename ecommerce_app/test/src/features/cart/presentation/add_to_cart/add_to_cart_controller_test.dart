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
      final controller = container.read(addToCartControllerProvider.notifier);
      final listener = Listener<AsyncValue<int>>();
      container.listen(
        addToCartControllerProvider,
        listener,
        fireImmediately: true,
      );
      // run
      const initialData = AsyncData<int>(1);
      // the build method returns a value immediately, so we expect AsyncData
      verify(() => listener(null, initialData));
      // update quantity
      controller.updateQuantity(quantity);
      // the quantity is updated
      verify(() => listener(initialData, const AsyncData<int>(quantity)));
      // add item
      await controller.addItem(productId);
      verifyInOrder(
        [
          // the loading state is set
          () => listener(
                const AsyncData<int>(quantity),
                const AsyncLoading<int>()
                    .copyWithPrevious(const AsyncData<int>(quantity)),
              ),
          // then the data is set with quantity: 1
          () => listener(
                const AsyncLoading<int>()
                    .copyWithPrevious(const AsyncData<int>(quantity)),
                initialData,
              ),
        ],
      );
      verifyNoMoreInteractions(listener);
      verify(() => cartService.addItem(item)).called(1);
    });

    test('item added with quantity = 2, failure', () async {
      const quantity = 2;
      const item = Item(productId: productId, quantity: quantity);
      final cartService = MockCartService();
      when(() => cartService.addItem(item))
          .thenThrow((_) => Exception('Connection failed'));
      final container = makeProviderContainer(cartService);
      final controller = container.read(addToCartControllerProvider.notifier);
      final listener = Listener<AsyncValue<int>>();
      container.listen(
        addToCartControllerProvider,
        listener,
        fireImmediately: true,
      );
      const initialData = AsyncData<int>(1);
      // the build method returns a value immediately, so we expect AsyncData
      verify(() => listener(null, initialData));
      // update quantity
      controller.updateQuantity(quantity);
      // the quantity is updated
      verify(
        () => listener(initialData, const AsyncData<int>(quantity)),
      );
      // add item
      await controller.addItem(productId);
      verifyInOrder(
        [
          // the loading state is set
          () => listener(
                const AsyncData<int>(quantity),
                const AsyncLoading<int>()
                    .copyWithPrevious(const AsyncData<int>(quantity)),
              ),
          // then an error is set
          () => listener(
                const AsyncLoading<int>()
                    .copyWithPrevious(const AsyncData<int>(quantity)),
                any(that: isA<AsyncError>()),
              ),
        ],
      );
      verifyNoMoreInteractions(listener);
      verify(() => cartService.addItem(item)).called(1);
    });
  });
}
