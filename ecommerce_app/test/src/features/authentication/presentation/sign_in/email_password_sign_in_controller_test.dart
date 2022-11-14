@Timeout(Duration(milliseconds: 500))
import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/sign_in/email_password_sign_in_controller.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/sign_in/email_password_sign_in_form_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  const testEmail = 'test@test.com';
  const testPassword = '1234';
  const testFormType = EmailPasswordSignInFormType.signIn;

  ProviderContainer makeProviderContainer(MockAuthRepository authRepository) {
    final container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(authRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('EmailPasswordSignInController', () {
    test('sign in success', () async {
      // setup
      final authRepository = MockAuthRepository();
      when(() => authRepository.signInWithEmailAndPassword(
            testEmail,
            testPassword,
          )).thenAnswer((_) => Future.value());
      final container = makeProviderContainer(authRepository);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        emailPasswordSignInControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      // verify initial value from build method
      verify(() => listener(null, data));
      // run
      final controller =
          container.read(emailPasswordSignInControllerProvider.notifier);
      final result = await controller.submit(
        email: testEmail,
        password: testPassword,
        formType: testFormType,
      );
      // verify
      expect(result, true);
      verifyInOrder([
        // set loading state
        () => listener(data, any(that: isA<AsyncLoading>())),
        // data when complete
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
    });
    test('sign in failure', () async {
      // setup
      final authRepository = MockAuthRepository();
      final exception = Exception('Connection failed');
      when(() => authRepository.signInWithEmailAndPassword(
            testEmail,
            testPassword,
          )).thenThrow(exception);
      final container = makeProviderContainer(authRepository);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        emailPasswordSignInControllerProvider,
        listener,
        fireImmediately: true,
      );
      // verify initial value from build method
      verify(() => listener(null, const AsyncData<void>(null)));
      // run
      final controller =
          container.read(emailPasswordSignInControllerProvider.notifier);
      final result = await controller.submit(
        email: testEmail,
        password: testPassword,
        formType: testFormType,
      );
      // verify
      expect(result, false);
      verifyInOrder([
        // set loading state
        () => listener(
            const AsyncData<void>(null), any(that: isA<AsyncLoading>())),
        // error when complete
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
    });
  });
}
