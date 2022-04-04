import 'dart:async';

import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppRouterListenable extends ChangeNotifier {
  AppRouterListenable({required this.authRepository}) {
    _authStateSubscription =
        authRepository.authStateChanges().listen((appUser) {
      _isLoggedIn = appUser != null;
      notifyListeners();
    });
  }
  final FakeAuthRepository authRepository;
  late final StreamSubscription<AppUser?> _authStateSubscription;
  var _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  @override
  void dispose() {
    _authStateSubscription.cancel();
    super.dispose();
  }
}

final appRouterListenableProvider =
    ChangeNotifierProvider<AppRouterListenable>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AppRouterListenable(authRepository: authRepository);
});
