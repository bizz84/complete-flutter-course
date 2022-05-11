import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/sign_in/email_password_sign_in_controller.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/sign_in/email_password_sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements FakeAuthRepository {}

void main() {
  const testEmail = 'test@test.com';
  const testPassword = '1234';

  group('submit', () {
    test(
      '''
    Given formType is signIn
    When signInWithEmailAndPassword succeeds
    Then return true
    And state is AsyncData
    ''',
      () async {
        // setup
        final authRepository = MockAuthRepository();
        when(() => authRepository.signInWithEmailAndPassword(
              testEmail,
              testPassword,
            )).thenAnswer((_) => Future.value());
        final controller = EmailPasswordSignInController(
          authRepository: authRepository,
          formType: EmailPasswordSignInFormType.signIn,
        );
        // expect later
        expectLater(
          controller.stream,
          emitsInOrder([
            EmailPasswordSignInState(
              formType: EmailPasswordSignInFormType.signIn,
              value: const AsyncLoading<void>(),
            ),
            EmailPasswordSignInState(
              formType: EmailPasswordSignInFormType.signIn,
              value: const AsyncData<void>(null),
            ),
          ]),
        );
        // run
        final result = await controller.submit(testEmail, testPassword);
        // verify
        expect(result, true);
      },
      timeout: const Timeout(Duration(milliseconds: 500)),
    );
    test(
      '''
    Given formType is signIn
    When signInWithEmailAndPassword fails
    Then return false
    And state is AsyncError
    ''',
      () async {
        // setup
        final authRepository = MockAuthRepository();
        final exception = Exception('Connection failed');
        when(() => authRepository.signInWithEmailAndPassword(
              testEmail,
              testPassword,
            )).thenThrow(exception);
        final controller = EmailPasswordSignInController(
          authRepository: authRepository,
          formType: EmailPasswordSignInFormType.signIn,
        );
        // expect later
        expectLater(
          controller.stream,
          emitsInOrder([
            EmailPasswordSignInState(
              formType: EmailPasswordSignInFormType.signIn,
              value: const AsyncLoading<void>(),
            ),
            predicate<EmailPasswordSignInState>((state) {
              expect(state.formType, EmailPasswordSignInFormType.signIn);
              expect(state.value.hasError, true);
              return true;
            }),
          ]),
        );
        // run
        final result = await controller.submit(testEmail, testPassword);
        // verify
        expect(result, false);
      },
      timeout: const Timeout(Duration(milliseconds: 500)),
    );
  });
  group('updateFormType', () {});
}
