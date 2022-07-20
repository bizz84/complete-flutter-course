import 'package:ecommerce_app/src/localization/string_hardcoded.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException {
  // Auth
  const factory AppException.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AppException.weakPassword() = WeakPassword;
  const factory AppException.wrongPassword() = WrongPassword;
  const factory AppException.userNotFound() = UserNotFound;
  // Cart
  const factory AppException.cartSyncFailed() = CartSyncFailed;
  // Checkout
  const factory AppException.paymentFailureEmptyCart() =
      PaymentFailureEmptyCart;
  // Orders
  const factory AppException.parseOrderFailure(String status) =
      ParseOrderFailure;
}

class AppExceptionData {
  AppExceptionData(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => 'AppExceptionData(code: $code, message: $message)';
}

extension AppExceptionDetails on AppException {
  AppExceptionData get details {
    return when(
      // Auth
      emailAlreadyInUse: () => AppExceptionData(
        'email-already-in-use',
        'Email already in use'.hardcoded,
      ),
      weakPassword: () => AppExceptionData(
        'weak-password',
        'Password is too weak'.hardcoded,
      ),
      wrongPassword: () => AppExceptionData(
        'wrong-password',
        'Wrong password'.hardcoded,
      ),
      userNotFound: () => AppExceptionData(
        'user-not-found',
        'User not found'.hardcoded,
      ),
      // Cart
      cartSyncFailed: () => AppExceptionData(
        'cart-sync-failed',
        'An error has occurred while updating the shopping cart'.hardcoded,
      ),
      // Checkout
      paymentFailureEmptyCart: () => AppExceptionData(
        'payment-failure-empty-cart',
        'Can\'t place an order if the cart is empty'.hardcoded,
      ),
      // Orders
      parseOrderFailure: (status) => AppExceptionData(
        'parse-order-failure',
        'Could not parse order status: $status'.hardcoded,
      ),
    );
  }
}
