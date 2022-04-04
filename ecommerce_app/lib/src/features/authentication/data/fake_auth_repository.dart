import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:ecommerce_app/src/utils/delay.dart';
import 'package:ecommerce_app/src/utils/in_memory_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class FakeAuthRepository {
  FakeAuthRepository({this.addDelay = true});
  final bool addDelay;

  final _authState = InMemoryStore<AppUser?>(null);

  Stream<AppUser?> authStateChanges() => _authState.stream;
  AppUser? get currentUser => _authState.value;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await delay(addDelay);
    // TODO: Do we need this check?
    if (currentUser == null) {
      _createNewUser();
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await delay(addDelay);
    if (currentUser == null) {
      _createNewUser();
    }
  }

  Future<void> signOut() async {
    await delay(addDelay);
    _authState.value = null;
  }

  void _createNewUser() {
    _authState.value = AppUser(uid: const Uuid().v1(), email: 'test@test.com');
  }
}

final authRepositoryProvider = Provider<FakeAuthRepository>((ref) {
  return FakeAuthRepository();
});

final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authService = ref.watch(authRepositoryProvider);
  return authService.authStateChanges();
});
