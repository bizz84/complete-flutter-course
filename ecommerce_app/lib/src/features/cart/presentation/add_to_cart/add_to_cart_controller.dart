import 'package:ecommerce_app/src/features/cart/application/cart_service.dart';
import 'package:ecommerce_app/src/features/cart/domain/item.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddToCartController extends StateNotifier<AsyncValue<void>> {
  AddToCartController(this.ref) : super(const AsyncData(null));
  final Ref ref;

  Future<void> addItem(ProductID productId) async {
    final quantity = ref.read(itemQuantityProvider);
    final cartService = ref.read(cartServiceProvider);
    final item = Item(productId: productId, quantity: quantity);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => cartService.addItem(item));
    if (!state.hasError) {
      ref.read(itemQuantityProvider.notifier).state = 1;
    }
  }
}

final addToCartControllerProvider =
    StateNotifierProvider.autoDispose<AddToCartController, AsyncValue<void>>(
        (ref) {
  return AddToCartController(ref);
});

final itemQuantityProvider = StateProvider.autoDispose<int>((ref) {
  return 1;
});
