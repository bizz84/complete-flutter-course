import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeAuthRepository {
  Stream<AppUser?> authStateChanges() => Stream.value(null);
  AppUser? get currentUser => null;

  Future<void> signInWithEmailAndPassword(
      String email, String password) async {}

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {}

  Future<void> signOut() async {}
}

final authRepositoryProvider = Provider<FakeAuthRepository>((ref) {
  return FakeAuthRepository();
});

final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
