import 'dart:async';

import 'package:ecommerce_app/src/features/checkout/application/fake_checkout_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentButtonController extends AutoDisposeAsyncNotifier<void> {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    // ok to leave this empty if the return type is FutureOr<void>
  }

  Future<void> pay() async {
    final checkoutService = ref.read(checkoutServiceProvider);
    state = const AsyncLoading();
    final newState = await AsyncValue.guard(checkoutService.placeOrder);
    // * Check if the controller is mounted before setting the state to prevent:
    // * Bad state: Tried to use PaymentButtonController after `dispose` was called.
    if (mounted) {
      state = newState;
    }
  }
}

final paymentButtonControllerProvider =
    AutoDisposeAsyncNotifierProvider<PaymentButtonController, void>(
        PaymentButtonController.new);
