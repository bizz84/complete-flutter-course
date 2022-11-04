import 'dart:async';

import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/sign_in/email_password_sign_in_form_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailPasswordSignInController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // ok to leave this empty if the return type is FutureOr<void>
  }

  Future<bool> submit(
      {required String email,
      required String password,
      required EmailPasswordSignInFormType formType}) async {
    state = const AsyncLoading();
    state =
        await AsyncValue.guard(() => _authenticate(email, password, formType));
    return state.hasError == false;
  }

  Future<void> _authenticate(
      String email, String password, EmailPasswordSignInFormType formType) {
    final authRepository = ref.read(authRepositoryProvider);
    switch (formType) {
      case EmailPasswordSignInFormType.signIn:
        return authRepository.signInWithEmailAndPassword(email, password);
      case EmailPasswordSignInFormType.register:
        return authRepository.createUserWithEmailAndPassword(email, password);
    }
  }
}

final emailPasswordSignInControllerProvider =
    AutoDisposeAsyncNotifierProvider<EmailPasswordSignInController, void>(
        EmailPasswordSignInController.new);
