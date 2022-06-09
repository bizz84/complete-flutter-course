import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:ecommerce_app/src/utils/delay.dart';
import 'package:ecommerce_app/src/utils/in_memory_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeRemoteCartRepository {
  FakeRemoteCartRepository({this.addDelay = true});
  final bool addDelay;

  final _cart = InMemoryStore<Map<String, Cart>>({});

  Future<Cart> fetchCart(String uid) {
    return Future.value(_cart.value[uid] ?? const Cart());
  }

  Stream<Cart> watchCart(String uid) {
    return _cart.stream.map((cartData) {
      return cartData[uid] ?? const Cart();
    });
  }

  Future<void> setCart(String uid, Cart items) async {
    await delay(addDelay);
    // First, get the current cart data
    final value = _cart.value;
    // Then, set the items for the given uid
    value[uid] = items;
    // Finally, update the cart data (will emit a new value)
    _cart.value = value;
  }
}

final remoteCartRepositoryProvider = Provider<FakeRemoteCartRepository>((ref) {
  return FakeRemoteCartRepository();
});
