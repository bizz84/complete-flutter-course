import 'package:ecommerce_app/src/features/authentication/presentation/sign_in/email_password_sign_in_controller.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/sign_in/email_password_sign_in_state.dart';
import 'package:ecommerce_app/src/utils/void_async_value.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  const testEmail = 'test@test.com';
  const testPassword = '1234';
  group('signInWithEmailAndPassword', () {
    test('Given submit called When success Then returns true And state is data',
        () async {
      // setup
      final authRepository = MockAuthRepository();
      when(() => authRepository.signInWithEmailAndPassword(
          testEmail, testPassword)).thenAnswer((_) async => Future.value(null));
      final controller = EmailPasswordSignInController(
        authRepository: authRepository,
        formType: EmailPasswordSignInFormType.signIn,
      );
      // run
      // expect(
      //   controller.stream,
      //   emitsInOrder(
      //     [
      //       EmailPasswordSignInState(
      //         formType: EmailPasswordSignInFormType.signIn,
      //         state: const VoidAsyncValue.loading(),
      //       ),
      //       EmailPasswordSignInState(
      //         formType: EmailPasswordSignInFormType.signIn,
      //         state: const VoidAsyncValue.data(null),
      //       )
      //     ],
      //   ),
      // );
      await controller.submit(testEmail, testPassword);
      // verify
      expect(
        controller.debugState,
        EmailPasswordSignInState(
          formType: EmailPasswordSignInFormType.signIn,
          state: const VoidAsyncValue.data(null),
        ),
      );
    });

    test(
        'Given submit called When failure Then returns false And state is error',
        () async {
      // setup
      final authRepository = MockAuthRepository();
      final exception = Exception('Connection failed');
      when(() => authRepository.signInWithEmailAndPassword(
          testEmail, testPassword)).thenThrow(exception);
      final controller = EmailPasswordSignInController(
        authRepository: authRepository,
        formType: EmailPasswordSignInFormType.signIn,
      );
      // run
      await controller.submit(testEmail, testPassword);
      // verify
      expect(
        controller.debugState,
        EmailPasswordSignInState(
          formType: EmailPasswordSignInFormType.signIn,
          state: VoidAsyncValue.error(exception),
        ),
      );
    });
  });

  group('createUserWithEmailAndPassword', () {
    test('Given submit called When success Then returns true And state is data',
        () async {
      // setup
      final authRepository = MockAuthRepository();
      when(() => authRepository.createUserWithEmailAndPassword(
          testEmail, testPassword)).thenAnswer((_) async => Future.value(null));
      final controller = EmailPasswordSignInController(
        authRepository: authRepository,
        formType: EmailPasswordSignInFormType.register,
      );
      await controller.submit(testEmail, testPassword);
      // verify
      expect(
        controller.debugState,
        EmailPasswordSignInState(
          formType: EmailPasswordSignInFormType.register,
          state: const VoidAsyncValue.data(null),
        ),
      );
    });

    test(
        'Given submit called When failure Then returns false And state is error',
        () async {
      // setup
      final authRepository = MockAuthRepository();
      final exception = Exception('Connection failed');
      when(() => authRepository.createUserWithEmailAndPassword(
          testEmail, testPassword)).thenThrow(exception);
      final controller = EmailPasswordSignInController(
        authRepository: authRepository,
        formType: EmailPasswordSignInFormType.register,
      );
      // run
      await controller.submit(testEmail, testPassword);
      // verify
      expect(
        controller.debugState,
        EmailPasswordSignInState(
          formType: EmailPasswordSignInFormType.register,
          state: VoidAsyncValue.error(exception),
        ),
      );
    });
  });

  group('updateFormType', () {
    test(
        'Given formType is signIn When updateFormType called Then toggles formType',
        () {
      // setup
      final authRepository = MockAuthRepository();
      final controller = EmailPasswordSignInController(
        authRepository: authRepository,
        formType: EmailPasswordSignInFormType.signIn,
      );
      // run
      controller.updateFormType(EmailPasswordSignInFormType.register);
      // verify
      expect(
        controller.debugState,
        EmailPasswordSignInState(
          formType: EmailPasswordSignInFormType.register,
          state: const VoidAsyncValue.data(null),
        ),
      );
    });

    test(
        'Given formType is register When updateFormType called Then toggles formType',
        () {
      // setup
      final authRepository = MockAuthRepository();
      final controller = EmailPasswordSignInController(
        authRepository: authRepository,
        formType: EmailPasswordSignInFormType.register,
      );
      // run
      controller.updateFormType(EmailPasswordSignInFormType.signIn);
      // verify
      expect(
        controller.debugState,
        EmailPasswordSignInState(
          formType: EmailPasswordSignInFormType.signIn,
          state: const VoidAsyncValue.data(null),
        ),
      );
    });
  });
}
