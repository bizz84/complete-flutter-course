import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_app/src/features/authentication/presentation/sign_in/string_validators.dart';
import 'package:ecommerce_app/src/localization/string_hardcoded.dart';

/// Form type for email & password authentication
enum EmailPasswordSignInFormType { signIn, register }

/// Mixin class to be used for client-side email & password validation
mixin EmailAndPasswordValidators {
  final StringValidator emailSubmitValidator = EmailSubmitRegexValidator();
  final StringValidator passwordRegisterSubmitValidator =
      MinLengthStringValidator(8);
  final StringValidator passwordSignInSubmitValidator =
      NonEmptyStringValidator();
}

/// State class for the email & password form.
class EmailPasswordSignInState with EmailAndPasswordValidators {
  EmailPasswordSignInState({
    this.formType = EmailPasswordSignInFormType.signIn,
    this.value = const AsyncValue.data(null),
  });

  final EmailPasswordSignInFormType formType;
  final AsyncValue<void> value;

  bool get isLoading => value.isLoading;

  EmailPasswordSignInState copyWith({
    EmailPasswordSignInFormType? formType,
    AsyncValue<void>? value,
  }) {
    return EmailPasswordSignInState(
      formType: formType ?? this.formType,
      value: value ?? this.value,
    );
  }

  @override
  String toString() =>
      'EmailPasswordSignInState(formType: $formType, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmailPasswordSignInState &&
        other.formType == formType &&
        other.value == value;
  }

  @override
  int get hashCode => formType.hashCode ^ value.hashCode;
}

extension EmailPasswordSignInStateX on EmailPasswordSignInState {
  String get passwordLabelText {
    if (formType == EmailPasswordSignInFormType.register) {
      return 'Password (8+ characters)'.hardcoded;
    } else {
      return 'Password'.hardcoded;
    }
  }

  // Getters
  String get primaryButtonText {
    if (formType == EmailPasswordSignInFormType.register) {
      return 'Create an account'.hardcoded;
    } else {
      return 'Sign in'.hardcoded;
    }
  }

  String get secondaryButtonText {
    if (formType == EmailPasswordSignInFormType.register) {
      return 'Have an account? Sign in'.hardcoded;
    } else {
      return 'Need an account? Register'.hardcoded;
    }
  }

  EmailPasswordSignInFormType get secondaryActionFormType {
    if (formType == EmailPasswordSignInFormType.register) {
      return EmailPasswordSignInFormType.signIn;
    } else {
      return EmailPasswordSignInFormType.register;
    }
  }

  String get errorAlertTitle {
    if (formType == EmailPasswordSignInFormType.register) {
      return 'Registration failed'.hardcoded;
    } else {
      return 'Sign in failed'.hardcoded;
    }
  }

  String get title {
    if (formType == EmailPasswordSignInFormType.register) {
      return 'Register'.hardcoded;
    } else {
      return 'Sign in'.hardcoded;
    }
  }

  bool canSubmitEmail(String email) {
    return emailSubmitValidator.isValid(email);
  }

  bool canSubmitPassword(String password) {
    if (formType == EmailPasswordSignInFormType.register) {
      return passwordRegisterSubmitValidator.isValid(password);
    }
    return passwordSignInSubmitValidator.isValid(password);
  }

  String? emailErrorText(String email) {
    final bool showErrorText = !canSubmitEmail(email);
    final String errorText = email.isEmpty
        ? 'Email can\'t be empty'.hardcoded
        : 'Invalid email'.hardcoded;
    return showErrorText ? errorText : null;
  }

  String? passwordErrorText(String password) {
    final bool showErrorText = !canSubmitPassword(password);
    final String errorText = password.isEmpty
        ? 'Password can\'t be empty'.hardcoded
        : 'Password is too short'.hardcoded;
    return showErrorText ? errorText : null;
  }
}
