import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';

/// API for reading, watching and writing local cart data (guest user)
abstract class LocalCartRepository {
  Future<Cart> fetchCart();

  Stream<Cart> watchCart();

  Future<void> setCart(Cart cart);
}

final localCartRepositoryProvider = Provider<LocalCartRepository>((ref) {
  // * Override this in the main method
  throw UnimplementedError();
});
