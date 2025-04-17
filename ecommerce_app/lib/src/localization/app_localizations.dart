import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'My Shop'**
  String get appTitle;

  /// No description provided for @previewNotice.
  ///
  /// In en, this message translates to:
  /// **'This is a preview of the final app that you\'ll build in the course. More features will be added before the course is complete.'**
  String get previewNotice;

  /// The title to be shown in the menu bar
  ///
  /// In en, this message translates to:
  /// **'My Shop'**
  String get appBarTitle;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @anErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get anErrorOccurred;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @admin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get admin;

  /// Title of the sign in page
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgotPassword;

  /// No description provided for @forgotPasswordQuestion.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPasswordQuestion;

  /// No description provided for @createAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get createAnAccount;

  /// No description provided for @needAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Need an account? Register'**
  String get needAnAccount;

  /// No description provided for @haveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Have an account? Sign in'**
  String get haveAnAccount;

  /// No description provided for @signInFailed.
  ///
  /// In en, this message translates to:
  /// **'Sign in failed'**
  String get signInFailed;

  /// No description provided for @registrationFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration failed'**
  String get registrationFailed;

  /// No description provided for @passwordResetFailed.
  ///
  /// In en, this message translates to:
  /// **'Password reset failed'**
  String get passwordResetFailed;

  /// No description provided for @sendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send reset link'**
  String get sendResetLink;

  /// No description provided for @backToSignIn.
  ///
  /// In en, this message translates to:
  /// **'Back to sign in'**
  String get backToSignIn;

  /// No description provided for @resetLinkSentTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset link sent'**
  String get resetLinkSentTitle;

  /// No description provided for @resetLinkSentMessage.
  ///
  /// In en, this message translates to:
  /// **'Check your email to reset your password'**
  String get resetLinkSentMessage;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'test@test.com'**
  String get emailHint;

  /// No description provided for @password8CharactersLabel.
  ///
  /// In en, this message translates to:
  /// **'Password (8+ characters)'**
  String get password8CharactersLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @invalidEmailEmpty.
  ///
  /// In en, this message translates to:
  /// **'Email can\'t be empty'**
  String get invalidEmailEmpty;

  /// No description provided for @invalidPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password is too short'**
  String get invalidPasswordTooShort;

  /// No description provided for @invalidPasswordEmpty.
  ///
  /// In en, this message translates to:
  /// **'Password can\'t be empty'**
  String get invalidPasswordEmpty;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalidEmail;

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'Email already in use'**
  String get emailAlreadyInUse;

  /// No description provided for @weakPassword.
  ///
  /// In en, this message translates to:
  /// **'Password is too weak'**
  String get weakPassword;

  /// No description provided for @operationNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'Operation not allowed'**
  String get operationNotAllowed;

  /// No description provided for @wrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Wrong password'**
  String get wrongPassword;

  /// No description provided for @userNotFound.
  ///
  /// In en, this message translates to:
  /// **'User not found'**
  String get userNotFound;

  /// No description provided for @userDisabled.
  ///
  /// In en, this message translates to:
  /// **'User disabled'**
  String get userDisabled;

  /// No description provided for @tooManyAuthRequests.
  ///
  /// In en, this message translates to:
  /// **'This account has been locked due to too many failed login attempts. Please try again later.'**
  String get tooManyAuthRequests;

  /// No description provided for @permissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied'**
  String get permissionDenied;

  /// When the product was purchased
  ///
  /// In en, this message translates to:
  /// **'Purchased on {date}'**
  String purchasedOnDate(String date);

  /// No description provided for @leaveReview.
  ///
  /// In en, this message translates to:
  /// **'Leave a review'**
  String get leaveReview;

  /// No description provided for @yourReviewHint.
  ///
  /// In en, this message translates to:
  /// **'Your review (optional)'**
  String get yourReviewHint;

  /// No description provided for @previouslyReviewedHint.
  ///
  /// In en, this message translates to:
  /// **'You reviewed this product before. You can edit your review.'**
  String get previouslyReviewedHint;

  /// The number of ratings
  ///
  /// In en, this message translates to:
  /// **'({count, plural, =1{1 rating} other{{count} ratings}})'**
  String numRatings(int count);

  /// Title of the address page
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @townCity.
  ///
  /// In en, this message translates to:
  /// **'Town/City'**
  String get townCity;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @postalCode.
  ///
  /// In en, this message translates to:
  /// **'Postal Code'**
  String get postalCode;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// Message for product fields that can't be empty
  ///
  /// In en, this message translates to:
  /// **'Can\'t be empty'**
  String get cantBeEmpty;

  /// No description provided for @invalidUrl.
  ///
  /// In en, this message translates to:
  /// **'Not a valid URL'**
  String get invalidUrl;

  /// No description provided for @minimumLength20Chars.
  ///
  /// In en, this message translates to:
  /// **'Minimum length: 20 characters'**
  String get minimumLength20Chars;

  /// No description provided for @invalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Not a valid number'**
  String get invalidNumber;

  /// No description provided for @priceGreaterThanZero.
  ///
  /// In en, this message translates to:
  /// **'Price must be greater than zero'**
  String get priceGreaterThanZero;

  /// No description provided for @priceLessThanMax.
  ///
  /// In en, this message translates to:
  /// **'The maximum price must be less than \$100,000'**
  String get priceLessThanMax;

  /// No description provided for @quantityGreaterThanZero.
  ///
  /// In en, this message translates to:
  /// **'Quantity must be zero or more'**
  String get quantityGreaterThanZero;

  /// No description provided for @quantityLessThanMax.
  ///
  /// In en, this message translates to:
  /// **'The maximum quantity must be less than 1,000'**
  String get quantityLessThanMax;

  /// Field label used in account page
  ///
  /// In en, this message translates to:
  /// **'Field'**
  String get field;

  /// No description provided for @value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// No description provided for @uidLowercase.
  ///
  /// In en, this message translates to:
  /// **'uid'**
  String get uidLowercase;

  /// No description provided for @emailLowercase.
  ///
  /// In en, this message translates to:
  /// **'email'**
  String get emailLowercase;

  /// No description provided for @isAdminLowercase.
  ///
  /// In en, this message translates to:
  /// **'isAdmin'**
  String get isAdminLowercase;

  /// Admin Dashboard page title
  ///
  /// In en, this message translates to:
  /// **'Admin Dashboard'**
  String get adminDashboard;

  /// No description provided for @manageOrders.
  ///
  /// In en, this message translates to:
  /// **'Manage Orders'**
  String get manageOrders;

  /// No description provided for @userId.
  ///
  /// In en, this message translates to:
  /// **'User ID'**
  String get userId;

  /// No description provided for @userEmail.
  ///
  /// In en, this message translates to:
  /// **'User Email'**
  String get userEmail;

  /// No description provided for @newProduct.
  ///
  /// In en, this message translates to:
  /// **'New Product'**
  String get newProduct;

  /// No description provided for @editProduct.
  ///
  /// In en, this message translates to:
  /// **'Edit Product'**
  String get editProduct;

  /// No description provided for @productUpdated.
  ///
  /// In en, this message translates to:
  /// **'Product updated'**
  String get productUpdated;

  /// No description provided for @couldNotSaveProduct.
  ///
  /// In en, this message translates to:
  /// **'Could not save product data'**
  String get couldNotSaveProduct;

  /// No description provided for @couldNotUpdateOrderStatus.
  ///
  /// In en, this message translates to:
  /// **'Could not update order status'**
  String get couldNotUpdateOrderStatus;

  /// No description provided for @imageUrl.
  ///
  /// In en, this message translates to:
  /// **'Image URL'**
  String get imageUrl;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @availableQuantity.
  ///
  /// In en, this message translates to:
  /// **'Available Quantity'**
  String get availableQuantity;

  /// No description provided for @manageProducts.
  ///
  /// In en, this message translates to:
  /// **'Manage Products'**
  String get manageProducts;

  /// Payment page title
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @cardPayment.
  ///
  /// In en, this message translates to:
  /// **'Card Payment'**
  String get cardPayment;

  /// No description provided for @saveCardDuringPayment.
  ///
  /// In en, this message translates to:
  /// **'Save card during payment'**
  String get saveCardDuringPayment;

  /// No description provided for @devBuildTestingNotice.
  ///
  /// In en, this message translates to:
  /// **'[DEV build] Use 4242 4242 4242 4242 for testing'**
  String get devBuildTestingNotice;

  /// No description provided for @missingAddress.
  ///
  /// In en, this message translates to:
  /// **'The operation can\'t be completed (missing address)'**
  String get missingAddress;

  /// No description provided for @userNotSignedIn.
  ///
  /// In en, this message translates to:
  /// **'The operation can\'t be completed (not signed in)'**
  String get userNotSignedIn;

  /// No description provided for @orderPlaced.
  ///
  /// In en, this message translates to:
  /// **'Order placed'**
  String get orderPlaced;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// The total value of the shopping cart
  ///
  /// In en, this message translates to:
  /// **'Total: {value}'**
  String totalValue(String value);

  /// Title of orders page
  ///
  /// In en, this message translates to:
  /// **'Your Orders'**
  String get yourOrders;

  /// No description provided for @noPreviousOrders.
  ///
  /// In en, this message translates to:
  /// **'No previous orders'**
  String get noPreviousOrders;

  /// No description provided for @couldNotPlaceOrder.
  ///
  /// In en, this message translates to:
  /// **'Could not place order'**
  String get couldNotPlaceOrder;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status:'**
  String get status;

  /// No description provided for @confirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get confirmed;

  /// No description provided for @confirmedPreparingDelivery.
  ///
  /// In en, this message translates to:
  /// **'Confirmed - preparing for delivery'**
  String get confirmedPreparingDelivery;

  /// No description provided for @shipped.
  ///
  /// In en, this message translates to:
  /// **'Shipped'**
  String get shipped;

  /// No description provided for @delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get delivered;

  /// Heading for product listings
  ///
  /// In en, this message translates to:
  /// **'Latest Products'**
  String get latestProducts;

  /// No description provided for @searchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search products'**
  String get searchProducts;

  /// No description provided for @noProductsFound.
  ///
  /// In en, this message translates to:
  /// **'No products found'**
  String get noProductsFound;

  /// No description provided for @productNotFound.
  ///
  /// In en, this message translates to:
  /// **'Product not found'**
  String get productNotFound;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity:'**
  String get quantity;

  /// The quantity of the product to be added to the cart
  ///
  /// In en, this message translates to:
  /// **'Quantity: {quantity}'**
  String quantityValue(int quantity);

  /// The quantity of the product to be added to the cart
  ///
  /// In en, this message translates to:
  /// **'{quantity} available'**
  String quantityAvailable(int quantity);

  /// Title of shopping cart page
  ///
  /// In en, this message translates to:
  /// **'Shopping Cart'**
  String get shoppingCart;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @outOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get outOfStock;

  /// No description provided for @cantAddItemToCart.
  ///
  /// In en, this message translates to:
  /// **'Can\'t add item to cart'**
  String get cantAddItemToCart;

  /// No description provided for @cantUpdateQuantity.
  ///
  /// In en, this message translates to:
  /// **'Could not update quantity'**
  String get cantUpdateQuantity;

  /// No description provided for @cantDeleteItem.
  ///
  /// In en, this message translates to:
  /// **'Could not delete item'**
  String get cantDeleteItem;

  /// No description provided for @alreadyAddedToCart.
  ///
  /// In en, this message translates to:
  /// **'Already added to cart'**
  String get alreadyAddedToCart;

  /// No description provided for @shoppingCartEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your shopping cart is empty'**
  String get shoppingCartEmpty;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get goBack;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get pay;

  /// No description provided for @notFound404.
  ///
  /// In en, this message translates to:
  /// **'404 - Page not found!'**
  String get notFound404;

  /// No description provided for @goHome.
  ///
  /// In en, this message translates to:
  /// **'Go Home'**
  String get goHome;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
