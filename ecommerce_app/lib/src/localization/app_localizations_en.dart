// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'My Shop';

  @override
  String get previewNotice => 'This is a preview of the final app that you\'ll build in the course. More features will be added before the course is complete.';

  @override
  String get appBarTitle => 'My Shop';

  @override
  String get ok => 'OK';

  @override
  String get anErrorOccurred => 'An error occurred';

  @override
  String get orders => 'Orders';

  @override
  String get account => 'Account';

  @override
  String get admin => 'Admin';

  @override
  String get signIn => 'Sign In';

  @override
  String get register => 'Register';

  @override
  String get forgotPassword => 'Forgot password';

  @override
  String get forgotPasswordQuestion => 'Forgot password?';

  @override
  String get createAnAccount => 'Create an account';

  @override
  String get needAnAccount => 'Need an account? Register';

  @override
  String get haveAnAccount => 'Have an account? Sign in';

  @override
  String get signInFailed => 'Sign in failed';

  @override
  String get registrationFailed => 'Registration failed';

  @override
  String get passwordResetFailed => 'Password reset failed';

  @override
  String get sendResetLink => 'Send reset link';

  @override
  String get backToSignIn => 'Back to sign in';

  @override
  String get resetLinkSentTitle => 'Reset link sent';

  @override
  String get resetLinkSentMessage => 'Check your email to reset your password';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'test@test.com';

  @override
  String get password8CharactersLabel => 'Password (8+ characters)';

  @override
  String get passwordLabel => 'Password';

  @override
  String get invalidEmailEmpty => 'Email can\'t be empty';

  @override
  String get invalidPasswordTooShort => 'Password is too short';

  @override
  String get invalidPasswordEmpty => 'Password can\'t be empty';

  @override
  String get logout => 'Logout';

  @override
  String get submit => 'Submit';

  @override
  String get invalidEmail => 'Invalid email';

  @override
  String get emailAlreadyInUse => 'Email already in use';

  @override
  String get weakPassword => 'Password is too weak';

  @override
  String get operationNotAllowed => 'Operation not allowed';

  @override
  String get wrongPassword => 'Wrong password';

  @override
  String get userNotFound => 'User not found';

  @override
  String get userDisabled => 'User disabled';

  @override
  String get tooManyAuthRequests => 'This account has been locked due to too many failed login attempts. Please try again later.';

  @override
  String get permissionDenied => 'Permission denied';

  @override
  String purchasedOnDate(String date) {
    return 'Purchased on $date';
  }

  @override
  String get leaveReview => 'Leave a review';

  @override
  String get yourReviewHint => 'Your review (optional)';

  @override
  String get previouslyReviewedHint => 'You reviewed this product before. You can edit your review.';

  @override
  String numRatings(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ratings',
      one: '1 rating',
    );
    return '($_temp0)';
  }

  @override
  String get address => 'Address';

  @override
  String get townCity => 'Town/City';

  @override
  String get state => 'State';

  @override
  String get postalCode => 'Postal Code';

  @override
  String get country => 'Country';

  @override
  String get cantBeEmpty => 'Can\'t be empty';

  @override
  String get invalidUrl => 'Not a valid URL';

  @override
  String get minimumLength20Chars => 'Minimum length: 20 characters';

  @override
  String get invalidNumber => 'Not a valid number';

  @override
  String get priceGreaterThanZero => 'Price must be greater than zero';

  @override
  String get priceLessThanMax => 'The maximum price must be less than \$100,000';

  @override
  String get quantityGreaterThanZero => 'Quantity must be zero or more';

  @override
  String get quantityLessThanMax => 'The maximum quantity must be less than 1,000';

  @override
  String get field => 'Field';

  @override
  String get value => 'Value';

  @override
  String get uidLowercase => 'uid';

  @override
  String get emailLowercase => 'email';

  @override
  String get isAdminLowercase => 'isAdmin';

  @override
  String get adminDashboard => 'Admin Dashboard';

  @override
  String get manageOrders => 'Manage Orders';

  @override
  String get userId => 'User ID';

  @override
  String get userEmail => 'User Email';

  @override
  String get newProduct => 'New Product';

  @override
  String get editProduct => 'Edit Product';

  @override
  String get productUpdated => 'Product updated';

  @override
  String get couldNotSaveProduct => 'Could not save product data';

  @override
  String get couldNotUpdateOrderStatus => 'Could not update order status';

  @override
  String get imageUrl => 'Image URL';

  @override
  String get title => 'Title';

  @override
  String get description => 'Description';

  @override
  String get price => 'Price';

  @override
  String get availableQuantity => 'Available Quantity';

  @override
  String get manageProducts => 'Manage Products';

  @override
  String get payment => 'Payment';

  @override
  String get cardPayment => 'Card Payment';

  @override
  String get saveCardDuringPayment => 'Save card during payment';

  @override
  String get devBuildTestingNotice => '[DEV build] Use 4242 4242 4242 4242 for testing';

  @override
  String get missingAddress => 'The operation can\'t be completed (missing address)';

  @override
  String get userNotSignedIn => 'The operation can\'t be completed (not signed in)';

  @override
  String get orderPlaced => 'Order placed';

  @override
  String get total => 'Total';

  @override
  String totalValue(String value) {
    return 'Total: $value';
  }

  @override
  String get yourOrders => 'Your Orders';

  @override
  String get noPreviousOrders => 'No previous orders';

  @override
  String get couldNotPlaceOrder => 'Could not place order';

  @override
  String get status => 'Status:';

  @override
  String get confirmed => 'Confirmed';

  @override
  String get confirmedPreparingDelivery => 'Confirmed - preparing for delivery';

  @override
  String get shipped => 'Shipped';

  @override
  String get delivered => 'Delivered';

  @override
  String get latestProducts => 'Latest Products';

  @override
  String get searchProducts => 'Search products';

  @override
  String get noProductsFound => 'No products found';

  @override
  String get productNotFound => 'Product not found';

  @override
  String get quantity => 'Quantity:';

  @override
  String quantityValue(int quantity) {
    return 'Quantity: $quantity';
  }

  @override
  String quantityAvailable(int quantity) {
    return '$quantity available';
  }

  @override
  String get shoppingCart => 'Shopping Cart';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get outOfStock => 'Out of Stock';

  @override
  String get cantAddItemToCart => 'Can\'t add item to cart';

  @override
  String get cantUpdateQuantity => 'Could not update quantity';

  @override
  String get cantDeleteItem => 'Could not delete item';

  @override
  String get alreadyAddedToCart => 'Already added to cart';

  @override
  String get shoppingCartEmpty => 'Your shopping cart is empty';

  @override
  String get goBack => 'Go Back';

  @override
  String get checkout => 'Checkout';

  @override
  String get pay => 'Pay';

  @override
  String get notFound404 => '404 - Page not found!';

  @override
  String get goHome => 'Go Home';
}
