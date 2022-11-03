// ignore: library_annotations
@Timeout(Duration(milliseconds: 500))
import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/sign_in/email_password_sign_in_controller.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/sign_in/email_password_sign_in_form_type.dart';
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

  const testEmail = 'test@test.com';
  const testPassword = '1234';
  const testFormType = EmailPasswordSignInFormType.signIn;

  group('EmailPasswordSignInController', () {
    test('sign in success', () async {
      // setup
      final authRepository = MockAuthRepository();
      when(() => authRepository.signInWithEmailAndPassword(
            testEmail,
            testPassword,
          )).thenAnswer((_) => Future.value());
      final container = makeProviderContainer(authRepository);
      final controller =
          container.read(emailPasswordSignInControllerProvider.notifier);
      // expect later
      expectLater(
        controller.stream,
        emitsInOrder([
          const AsyncLoading<void>(),
          const AsyncData<void>(null),
        ]),
      );
      // run
      final result = await controller.submit(
        email: testEmail,
        password: testPassword,
        formType: testFormType,
      );
      // verify
      expect(result, true);
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
      final controller =
          container.read(emailPasswordSignInControllerProvider.notifier);
      // expect later
      expectLater(
        controller.stream,
        emitsInOrder([
          const AsyncLoading<void>(),
          predicate<AsyncValue<void>>((state) {
            expect(state.hasError, true);
            return true;
          }),
        ]),
      );
      // run
      final result = await controller.submit(
        email: testEmail,
        password: testPassword,
        formType: testFormType,
      );
      // verify
      expect(result, false);
    });
  });
}
