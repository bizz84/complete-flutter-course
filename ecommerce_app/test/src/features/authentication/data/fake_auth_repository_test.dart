import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testUid = '1';
  const testEmail = 'test@test.com';
  const testPassword = '1234';
  const testUser = AppUser(uid: testUid, email: testEmail);

  FakeAuthRepository makeAuthRepository() => FakeAuthRepository(
        addDelay: false,
        uidBuilder: () => testUid,
      );
  group('FakeAuthRepository', () {
    test('current user is null', () async {
      final authRepository = makeAuthRepository();
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });

    test('current user is set after sign in', () async {
      final authRepository = makeAuthRepository();
      await authRepository.signInWithEmailAndPassword(testEmail, testPassword);
      expect(authRepository.currentUser, testUser);
      expect(authRepository.authStateChanges(), emits(testUser));
    });

    test('current user is set after registration', () async {
      final authRepository = makeAuthRepository();
      await authRepository.createUserWithEmailAndPassword(
          testEmail, testPassword);
      expect(authRepository.currentUser, testUser);
      expect(authRepository.authStateChanges(), emits(testUser));
    });

    test('current user null after sign out', () async {
      final authRepository = makeAuthRepository();
      await authRepository.signInWithEmailAndPassword(testEmail, testPassword);
      await authRepository.signOut();
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });
  });
}

/* What is important to test? */
