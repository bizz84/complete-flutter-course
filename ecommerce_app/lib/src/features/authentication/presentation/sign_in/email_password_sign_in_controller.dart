import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/sign_in/email_password_sign_in_state.dart';
import 'package:ecommerce_app/src/utils/void_async_value.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailPasswordSignInController
    extends StateNotifier<EmailPasswordSignInState> {
  EmailPasswordSignInController({
    required this.authRepository,
    required EmailPasswordSignInFormType formType,
  }) : super(EmailPasswordSignInState(
          formType: formType,
          value: const VoidAsyncValue.data(null),
        ));
  final FakeAuthRepository authRepository;

  Future<bool> submit(String email, String password) async {
    state = state.copyWith(value: const VoidAsyncValue.loading());
    final value = await VoidAsyncValue.guard(() => _submit(email, password));
    state = state.copyWith(value: value);
    return !value.hasError;
  }

  Future<void> _submit(String email, String password) {
    switch (state.formType) {
      case EmailPasswordSignInFormType.signIn:
        return authRepository.signInWithEmailAndPassword(email, password);
      case EmailPasswordSignInFormType.register:
        return authRepository.createUserWithEmailAndPassword(email, password);
    }
  }

  void updateFormType(EmailPasswordSignInFormType formType) {
    state = state.copyWith(formType: formType);
  }

  void setSubmitted() {
    state = state.copyWith(submitted: true);
  }
}

final emailPasswordSignInControllerProvider = StateNotifierProvider.autoDispose
    .family<EmailPasswordSignInController, EmailPasswordSignInState,
        EmailPasswordSignInFormType>((ref, formType) {
  final authRepository = ref.watch(authRepositoryProvider);
  return EmailPasswordSignInController(
    authRepository: authRepository,
    formType: formType,
  );
});
