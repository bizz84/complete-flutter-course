import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:ecommerce_app/src/routing/auth_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Stream<AppUser?> authStateChanges() async* {
    await Future.delayed(const Duration(milliseconds: 1));
    yield null;
    await Future.delayed(const Duration(milliseconds: 1));
    yield const AppUser(uid: '1', email: 'test@test.com');
  }

  group('AuthStateNotifier', () {
    test('stream values set isLoggedIn variable', () async {
      final notifier = AuthStateNotifier(authStateChanges: authStateChanges());
      // wait for stream to emit all events
      await for (var user in authStateChanges()) {
        expect(notifier.isLoggedIn, user != null);
      }
    });

    test('stream values captured by listener', () async {
      final notifier = AuthStateNotifier(authStateChanges: authStateChanges());
      var values = <bool>[];
      notifier.addListener(() {
        values.add(notifier.isLoggedIn);
      });
      // wait for stream to emit all events
      await for (var _ in authStateChanges()) {}
      expect(values, [false, true]);
    });
  });
}
