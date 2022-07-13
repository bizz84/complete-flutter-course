import 'package:ecommerce_app/src/features/checkout/presentation/payment/payment_button_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  group('pay', () {
    test('success', () async {
      // setup
      final checkoutService = MockCheckoutService();
      when(() => checkoutService.placeOrder()).thenAnswer(
        (_) => Future.value(null),
      );
      final controller =
          PaymentButtonController(checkoutService: checkoutService);
      // run & verify
      expectLater(
        controller.stream,
        emitsInOrder([
          const AsyncLoading<void>(),
          const AsyncData<void>(null),
        ]),
      );
      await controller.pay();
    });

    test('failure', () async {
      // setup
      final checkoutService = MockCheckoutService();
      when(() => checkoutService.placeOrder()).thenThrow(
        Exception('Card declined'),
      );
      final controller =
          PaymentButtonController(checkoutService: checkoutService);
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
      await controller.pay();
    });
  });
}
