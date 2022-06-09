import 'package:ecommerce_app/src/features/cart/data/local/local_cart_repository.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:ecommerce_app/src/utils/delay.dart';
import 'package:ecommerce_app/src/utils/in_memory_store.dart';

class FakeLocalCartRepository implements LocalCartRepository {
  FakeLocalCartRepository({this.addDelay = true});
  final bool addDelay;

  final _cart = InMemoryStore<Cart>(const Cart());

  @override
  Future<Cart> fetchCart() => Future.value(_cart.value);

  @override
  Stream<Cart> watchCart() => _cart.stream;

  @override
  Future<void> setCart(Cart cart) async {
    await delay(addDelay);
    _cart.value = cart;
  }
}
