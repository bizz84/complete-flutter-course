import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:ecommerce_app/src/utils/delay.dart';
import 'package:ecommerce_app/src/utils/in_memory_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class FakeAuthRepository {
  FakeAuthRepository({this.addDelay = true, required this.uidBuilder});
  final bool addDelay;
  final String Function() uidBuilder;

  final _store = InMemoryStore<AppUser?>(null);

  Stream<AppUser?> authStateChanges() => _store.stream;
  AppUser? get currentUser => _store.value;

  void dispose() => _store.close();

  // * This is a fake repository so the password is ignored
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await delay(addDelay);
    if (currentUser == null) {
      _createNewUser(email);
    }
  }

  // * This is a fake repository so the password is ignored
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await delay(addDelay);
    if (currentUser == null) {
      _createNewUser(email);
    }
  }

  Future<void> signOut() async {
    await delay(addDelay);
    _store.value = null;
  }

  void _createNewUser(String email) {
    _store.value = AppUser(uid: uidBuilder(), email: email);
  }
}

final authRepositoryProvider = Provider<FakeAuthRepository>((ref) {
  final auth = FakeAuthRepository(
    uidBuilder: () => const Uuid().v1(),
  );
  ref.onDispose(() => auth.dispose());
  return auth;
});

final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authService = ref.watch(authRepositoryProvider);
  return authService.authStateChanges();
});
