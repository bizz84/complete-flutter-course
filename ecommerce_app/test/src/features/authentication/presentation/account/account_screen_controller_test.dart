@Timeout(Duration(milliseconds: 500))
import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/account/account_screen_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  ProviderContainer makeProviderContainer(MockAuthRepository authRepository) {
    final container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(authRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('AccountScreenController', () {
    test('initial state is AsyncValue.data', () {
      // setup
      final authRepository = MockAuthRepository();
      final container = makeProviderContainer(authRepository);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        accountScreenControllerProvider,
        listener,
        fireImmediately: true,
      );
      // verify initial value from build method
      verify(() => listener(null, const AsyncData<void>(null)));
      // no more interactions after that
      verifyNoMoreInteractions(listener);
      verifyNever(authRepository.signOut);
    });

    test('signOut success', () async {
      // setup
      final authRepository = MockAuthRepository();
      when(authRepository.signOut).thenAnswer((_) => Future.value());
      final container = makeProviderContainer(authRepository);
      final controller =
          container.read(accountScreenControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        accountScreenControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      // verify initial value from build method
      verify(() => listener(null, data));
      // run
      await controller.signOut();
      // verify
      verifyInOrder([
        // set loading state
        // * use a matcher since AsyncLoading != AsyncLoading with data
        () => listener(data, any(that: isA<AsyncLoading>())),
        // data when complete
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(authRepository.signOut).called(1);
    });
    test('signOut failure', () async {
      // setup
      final authRepository = MockAuthRepository();
      final exception = Exception('Connection failed');
      when(authRepository.signOut).thenThrow(exception);
      final container = makeProviderContainer(authRepository);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        accountScreenControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      // verify initial value from build method
      verify(() => listener(null, data));
      // run
      final controller =
          container.read(accountScreenControllerProvider.notifier);
      await controller.signOut();
      // verify
      verifyInOrder([
        // set loading state
        // * use a matcher since AsyncLoading != AsyncLoading with data
        () => listener(data, any(that: isA<AsyncLoading>())),
        // error when complete
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(authRepository.signOut).called(1);
    });
  });
}
