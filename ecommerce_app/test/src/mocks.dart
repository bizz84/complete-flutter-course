import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/cart/application/cart_service.dart';
import 'package:ecommerce_app/src/features/cart/data/local/local_cart_repository.dart';
import 'package:ecommerce_app/src/features/cart/data/remote/remote_cart_repository.dart';
import 'package:ecommerce_app/src/features/checkout/application/fake_checkout_service.dart';
import 'package:ecommerce_app/src/features/orders/data/fake_orders_repository.dart';
import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';
import 'package:ecommerce_app/src/features/reviews/application/reviews_service.dart';
import 'package:ecommerce_app/src/features/reviews/data/fake_reviews_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements FakeAuthRepository {}

class MockRemoteCartRepository extends Mock implements RemoteCartRepository {}

class MockLocalCartRepository extends Mock implements LocalCartRepository {}

class MockCartService extends Mock implements CartService {}

class MockProductsRepository extends Mock implements FakeProductsRepository {}

class MockOrdersRepository extends Mock implements FakeOrdersRepository {}

class MockCheckoutService extends Mock implements FakeCheckoutService {}

class MockReviewsRepository extends Mock implements FakeReviewsRepository {}

class MockReviewsService extends Mock implements ReviewsService {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}
