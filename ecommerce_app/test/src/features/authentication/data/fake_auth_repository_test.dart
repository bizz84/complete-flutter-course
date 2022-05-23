import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testEmail = 'test@test.com';
  const testPassword = '1234';
  final testUser = AppUser(
    uid: testEmail.split('').reversed.join(),
    email: testEmail,
  );
  FakeAuthRepository makeAuthRepository() => FakeAuthRepository(
        addDelay: false,
      );
  group('FakeAuthRepository', () {
    test('currentUser is null', () {
      final authRepository = makeAuthRepository();
      addTearDown(authRepository.dispose);
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });
    test('currentUser is not null after sign in', () async {
      final authRepository = makeAuthRepository();
      addTearDown(authRepository.dispose);
      await authRepository.signInWithEmailAndPassword(
        testEmail,
        testPassword,
      );
      expect(authRepository.currentUser, testUser);
      expect(authRepository.authStateChanges(), emits(testUser));
    });

    test('currentUser is not null after registration', () async {
      final authRepository = makeAuthRepository();
      addTearDown(authRepository.dispose);
      await authRepository.createUserWithEmailAndPassword(
        testEmail,
        testPassword,
      );
      expect(authRepository.currentUser, testUser);
      expect(authRepository.authStateChanges(), emits(testUser));
    });

    test('currentUser is null after sign out', () async {
      final authRepository = makeAuthRepository();
      addTearDown(authRepository.dispose);
      await authRepository.signInWithEmailAndPassword(
        testEmail,
        testPassword,
      );
      expect(authRepository.currentUser, testUser);
      expect(authRepository.authStateChanges(), emits(testUser));

      await authRepository.signOut();
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });

    test('sign in after dispose throws exception', () {
      final authRepository = makeAuthRepository();
      authRepository.dispose();
      expect(
        () => authRepository.signInWithEmailAndPassword(
          testEmail,
          testPassword,
        ),
        throwsStateError,
      );
    });
  });
}
