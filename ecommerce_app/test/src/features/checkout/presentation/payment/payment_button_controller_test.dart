import 'package:ecommerce_app/src/features/checkout/application/fake_checkout_service.dart';
import 'package:ecommerce_app/src/features/checkout/presentation/payment/payment_button_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  ProviderContainer makeProviderContainer(MockCheckoutService checkoutService) {
    final container = ProviderContainer(
      overrides: [
        checkoutServiceProvider.overrideWithValue(checkoutService),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('pay', () {
    test('success', () async {
      // setup
      final checkoutService = MockCheckoutService();
      when(() => checkoutService.placeOrder()).thenAnswer(
        (_) => Future.value(null),
      );
      final container = makeProviderContainer(checkoutService);
      final controller =
          container.read(paymentButtonControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        paymentButtonControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.pay();
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => checkoutService.placeOrder()).called(1);
    });

    test('failure', () async {
      // setup
      final checkoutService = MockCheckoutService();
      when(() => checkoutService.placeOrder()).thenThrow(
        Exception('Card declined'),
      );
      final container = makeProviderContainer(checkoutService);
      final controller =
          container.read(paymentButtonControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        paymentButtonControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.pay();
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => checkoutService.placeOrder()).called(1);
    });
  });
}
