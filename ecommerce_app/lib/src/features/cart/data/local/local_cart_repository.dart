import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';

abstract class LocalCartRepository {
  Future<Cart> fetchCart();

  Stream<Cart> watchCart();

  Future<void> setCart(Cart cart);
}

final localCartRepositoryProvider = Provider<LocalCartRepository>((ref) {
  // This should be overridden in main file
  throw UnimplementedError();
});
