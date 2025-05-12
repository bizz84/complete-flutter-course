import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/account/account_screen_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements FakeAuthRepository {}

void main() {
  late MockAuthRepository authRepository;
  late AccountScreenController controller;
  setUp(() {
    authRepository = MockAuthRepository();
    controller = AccountScreenController(
      authRepository: authRepository,
    );
  });
  group('AccountScreenController', () {
    test('initial state is AsyncValue.data', () {
      verifyNever(authRepository.signOut);
      expect(controller.state, const AsyncData<void>(null));
    });

    test(
      'signOut success',
      () async {
        // setup
        when(authRepository.signOut).thenAnswer(
          (_) => Future.value(),
        );
        // expect later
        expectLater(
          controller.stream,
          emitsInOrder(const [
            AsyncLoading<void>(),
            AsyncData<void>(null),
          ]),
        );
        // run
        await controller.signOut();
        // verify
        verify(authRepository.signOut).called(1);
      },
      timeout: const Timeout(Duration(milliseconds: 500)),
    );
    test(
      'signOut failure',
      () async {
        // setup
        final exception = Exception('Connection failed');
        when(authRepository.signOut).thenThrow(exception);
        // expect later
        expectLater(
          controller.stream,
          emitsInOrder([
            const AsyncLoading<void>(),
            predicate<AsyncValue<void>>((value) {
              expect(value.hasError, true);
              return true;
            }),
          ]),
        );
        // run
        await controller.signOut();
        // verify
        verify(authRepository.signOut).called(1);
      },
      timeout: const Timeout(Duration(milliseconds: 500)),
    );
  });
}
