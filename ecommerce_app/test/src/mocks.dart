import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/cart/application/cart_service.dart';
import 'package:ecommerce_app/src/features/cart/data/local/local_cart_repository.dart';
import 'package:ecommerce_app/src/features/cart/data/remote/remote_cart_repository.dart';
import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements FakeAuthRepository {}

class MockRemoteCartRepository extends Mock implements RemoteCartRepository {}

class MockLocalCartRepository extends Mock implements LocalCartRepository {}

class MockCartService extends Mock implements CartService {}

class MockProductsRepository extends Mock implements FakeProductsRepository {}
