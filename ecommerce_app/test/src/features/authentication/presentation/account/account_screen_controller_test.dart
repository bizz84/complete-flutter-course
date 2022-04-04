import 'package:ecommerce_app/src/features/authentication/presentation/account/account_screen_controller.dart';
import 'package:ecommerce_app/src/utils/void_async_value.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  group('AccountScreenController', () {
    test('signOut success', () async {
      // setup
      final authRepository = MockAuthRepository();
      when(() => authRepository.signOut())
          .thenAnswer((_) async => Future.value(null));
      final controller = AccountScreenController(
        authRepository: authRepository,
      );
      // run
      await controller.signOut();
      // verify
      verify(() => authRepository.signOut()).called(1);
      expect(controller.debugState, const VoidAsyncValue.data(null));
    });

    test('signOut failure', () async {
      // setup
      final authRepository = MockAuthRepository();
      final exception = Exception('Connection failed');
      when(() => authRepository.signOut()).thenThrow(exception);
      final controller = AccountScreenController(
        authRepository: authRepository,
      );
      // run
      await controller.signOut();
      // verify
      verify(() => authRepository.signOut()).called(1);
      expect(controller.debugState, VoidAsyncValue.error(exception));
    });
  });
}
