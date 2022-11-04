import 'dart:async';

import 'package:ecommerce_app/src/features/cart/application/cart_service.dart';
import 'package:ecommerce_app/src/features/cart/domain/item.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingCartScreenController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // ok to leave this empty if the return type is FutureOr<void>
  }

  CartService get cartService => ref.read(cartServiceProvider);

  Future<void> updateItemQuantity(ProductID productId, int quantity) async {
    state = const AsyncLoading();
    final updated = Item(productId: productId, quantity: quantity);
    state = await AsyncValue.guard(() => cartService.setItem(updated));
  }

  Future<void> removeItemById(ProductID productId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => cartService.removeItemById(productId));
  }
}

final shoppingCartScreenControllerProvider =
    AsyncNotifierProvider<ShoppingCartScreenController, void>(
        ShoppingCartScreenController.new);
