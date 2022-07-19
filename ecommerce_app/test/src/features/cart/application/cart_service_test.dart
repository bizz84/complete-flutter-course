import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:ecommerce_app/src/features/cart/application/cart_service.dart';
import 'package:ecommerce_app/src/features/cart/data/local/local_cart_repository.dart';
import 'package:ecommerce_app/src/features/cart/data/remote/remote_cart_repository.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:ecommerce_app/src/features/cart/domain/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(const Cart());
  });
  const testUser = AppUser(uid: 'abc', email: 'abc@test.com');

  late MockAuthRepository authRepository;
  late MockRemoteCartRepository remoteCartRepository;
  late MockLocalCartRepository localCartRepository;
  setUp(() {
    authRepository = MockAuthRepository();
    remoteCartRepository = MockRemoteCartRepository();
    localCartRepository = MockLocalCartRepository();
  });

  CartService makeCartService() {
    final container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(authRepository),
        localCartRepositoryProvider.overrideWithValue(localCartRepository),
        remoteCartRepositoryProvider.overrideWithValue(remoteCartRepository),
      ],
    );
    addTearDown(container.dispose);
    return container.read(cartServiceProvider);
  }

  group('setItem', () {
    test('null user, writes item to local cart', () async {
      // setup
      const expectedCart = Cart({'123': 1});
      when(() => authRepository.currentUser).thenReturn(null);
      when(localCartRepository.fetchCart).thenAnswer(
        (_) => Future.value(const Cart()),
      );
      when(() => localCartRepository.setCart(expectedCart)).thenAnswer(
        (_) => Future.value(),
      );
      final cartService = makeCartService();
      // run
      await cartService.setItem(
        const Item(productId: '123', quantity: 1),
      );
      // verify
      verify(
        () => localCartRepository.setCart(expectedCart),
      ).called(1);
      verifyNever(
        () => remoteCartRepository.setCart(any(), any()),
      );
    });

    test('non-null user, writes item to remote cart', () async {
      // setup
      const expectedCart = Cart({'123': 1});
      when(() => authRepository.currentUser).thenReturn(testUser);
      when(() => remoteCartRepository.fetchCart(testUser.uid)).thenAnswer(
        (_) => Future.value(const Cart()),
      );
      when(() => remoteCartRepository.setCart(testUser.uid, expectedCart))
          .thenAnswer(
        (_) => Future.value(),
      );
      final cartService = makeCartService();
      // run
      await cartService.setItem(
        const Item(productId: '123', quantity: 1),
      );
      // verify
      verify(
        () => remoteCartRepository.setCart(testUser.uid, expectedCart),
      ).called(1);
      verifyNever(
        () => localCartRepository.setCart(any()),
      );
    });
  });

  group('addItem', () {
    test('null user, adds item to local cart', () async {
      // setup
      const initialCart = Cart({'123': 2});
      const expectedCart = Cart({'123': 3});
      when(() => authRepository.currentUser).thenReturn(null); // null user
      when(localCartRepository.fetchCart).thenAnswer(
        (_) => Future.value(initialCart), // empty cart
      );
      when(() => localCartRepository.setCart(expectedCart)).thenAnswer(
        (_) => Future.value(),
      );
      final cartService = makeCartService();
      // run
      await cartService.addItem(const Item(productId: '123', quantity: 1));
      // verify
      verify(
        () => localCartRepository.setCart(expectedCart),
      ).called(1);
      verifyNever(
        () => remoteCartRepository.setCart(any(), any()),
      );
    });

    test('non-null user, adds item to remote cart', () async {
      // setup
      const initialCart = Cart({'123': 2});
      const expectedCart = Cart({'123': 3});
      when(() => authRepository.currentUser).thenReturn(testUser); // null user
      when(() => remoteCartRepository.fetchCart(testUser.uid)).thenAnswer(
        (_) => Future.value(initialCart), // empty cart
      );
      when(() => remoteCartRepository.setCart(testUser.uid, expectedCart))
          .thenAnswer(
        (_) => Future.value(),
      );
      final cartService = makeCartService();
      // run
      await cartService.addItem(const Item(productId: '123', quantity: 1));
      // verify
      verifyNever(
        () => localCartRepository.setCart(any()),
      );
      verify(
        () => remoteCartRepository.setCart(testUser.uid, expectedCart),
      ).called(1);
    });
  });

  group('removeItem', () {
    test('null user, removes item from local cart', () async {
      // setup
      const initialCart = Cart({'123': 3, '456': 1});
      const expectedCart = Cart({'456': 1});
      when(() => authRepository.currentUser).thenReturn(null); // null user
      when(localCartRepository.fetchCart).thenAnswer(
        (_) => Future.value(initialCart), // empty cart
      );
      when(() => localCartRepository.setCart(expectedCart)).thenAnswer(
        (_) => Future.value(),
      );
      final cartService = makeCartService();
      // run
      await cartService.removeItemById('123');
      // verify
      verify(
        () => localCartRepository.setCart(expectedCart),
      ).called(1);
      verifyNever(
        () => remoteCartRepository.setCart(any(), any()),
      );
    });

    test('non-null user, removes item from remote cart', () async {
      // setup
      const initialCart = Cart({'123': 3, '456': 1});
      const expectedCart = Cart({'456': 1});
      when(() => authRepository.currentUser).thenReturn(testUser); // null user
      when(() => remoteCartRepository.fetchCart(testUser.uid)).thenAnswer(
        (_) => Future.value(initialCart), // empty cart
      );
      when(() => remoteCartRepository.setCart(testUser.uid, expectedCart))
          .thenAnswer(
        (_) => Future.value(),
      );
      final cartService = makeCartService();
      // run
      await cartService.removeItemById('123');
      // verify
      verifyNever(
        () => localCartRepository.setCart(any()),
      );
      verify(
        () => remoteCartRepository.setCart(testUser.uid, expectedCart),
      ).called(1);
    });
  });
}
