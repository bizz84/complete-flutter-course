import 'dart:async';

import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:flutter/foundation.dart';

class AuthStateNotifier extends ChangeNotifier {
  AuthStateNotifier({required this.authStateChanges}) {
    _authStateSubscription = authStateChanges.listen((appUser) {
      _isLoggedIn = appUser != null;
      notifyListeners();
    });
  }
  final Stream<AppUser?> authStateChanges;
  late final StreamSubscription<AppUser?> _authStateSubscription;
  var _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  @override
  void dispose() {
    _authStateSubscription.cancel();
    super.dispose();
  }
}

// TODO: Show that this causes GoRouter to rebuild (unwanted)
// final authStateNotifierProvider =
//     ChangeNotifierProvider<AuthStateNotifier>((ref) {
//   final authRepository = ref.watch(authRepositoryProvider);
//   final result = AuthStateNotifier(
//     authStateChanges: authRepository.authStateChanges(),
//   );
//   ref.onDispose(() => result.dispose());
//   return result;
// });
