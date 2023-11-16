# Flutter Foundations Course - eCommerce App

This is the official repo for this course:

- [Flutter Foundations](https://codewithandrea.com/courses/flutter-foundations/)

This will include a full-stack eCommerce app using Flutter & Firebase:

![eCommerce App Preview](/.github/images/ecommerce-app-preview.png)

A Flutter web preview of the app can be found here:

- [Flutter Web Demo](https://ecommerce-app-scratch.web.app/)

## Project Setup

To clone the repo for the first time and open it in VSCode, run this:

```
git clone https://github.com/bizz84/complete-flutter-course.git
cd complete-flutter-course
code .
```

This will checkout the `main` branch which contains the **latest code**.

But at various points in the course, I'll ask you to checkout a **specific branch name**, so you can follow along with the right code, at the right time.

And to prevent any conflicts, you may need to reset your local changes:

```
git reset --hard HEAD
git checkout <branch-name>
```

## Documentation & FAQ

This project includes a documentation website that can be found here:

- [Complete Flutter Course Bundle - Documentation](https://docs.page/bizz84/complete-flutter-course)

## Flutter Foundations - Course Syllabus

### 1. Intro & Project Overview

1. What you will learn in this course
2. Section overview
3. VSCode Shortcuts, Extensions & Settings for Flutter development
4. Join the Slack Channel
5. Course Project on GitHub
6. Download the Starter Project & `pubspec.yaml` overview
7. eCommerce app overview
8. Code walkthrough: project structure
9. Exploring the codebase with the Widget Inspector (DevTools)
10. UI Design Principles: Composition & Reusable Widget Classes
11. Useful Widgets for Responsive Design
12. App Localization

### 2. Navigation with GoRouter

1. Section Intro
2. Limitations of Navigator 1.0
3. GoRouter installation & initial setup with `MaterialApp.router`
4. Routes, sub-routes and navigation
5. `GoRouterHelper` Extension and `pageBuilder`
6. Adding some additional routes
7. Routing by **path** vs routing by **name**
8. Routing with parameters
9. GoRouter error handling
10. Navigating with **go** vs **push**
11. Adding the remaining routes
12. How to pop a route with GoRouter
13. Nested Navigation
14. Bug fix & wrap up

### 3. Flutter App Architecture

1. Section Intro
2. Popular App Architectures: MVC, MVP, MVVM, Clean Architecture, Bloc
3. Riverpod App Architecture with the Controller-Service-Repository Pattern
4. Project Structure: Feature-first vs Layer-first
5. The Repository Pattern and the Data Layer
6. Implementing the "fake" products repository as a singleton
7. Working with Future and Stream-based APIs
8. Wrap Up

### 4. State Management with Riverpod - Part 1 (Product Listings)

1. Section Intro
2. Introduction to Riverpod
3. Riverpod installation and setup
4. Creating our first provider
5. Reading providers with `ConsumerWidget` and `Consumer`
6. Working with `FutureProvider`, `StreamProvider`, and `AsyncValue`
7. Testing `AsyncValue` by adding a delay
8. The `family` modifier
9. The `autoDispose` modifier + advanced data caching options
10. Creating a reusable `AsyncValueWidget` helper
11. Wrap Up + Exercise

### 5. State Management with Riverpod - Part 2 (Authentication Flow)

1. Section intro
2. Implementing a fake authentication repository
3. Creating repositories using abstract classes (optional)
4. Intro: a reactive in-memory store with RxDart
5. Implementing the `InMemoryStore` with RxDart
6. Using the `InMemoryStore` in the `FakeAuthRepository`
7. Accessing the `FakeAuthRepository` with `ref.read()` in the `AccountScreen`
8. Creating our first controller using `StateNotifier`
9. Using the `StateNotifier` inside the `AccountScreen` widget
10. Listening to provider state changes with `ref.listen()`
11. Bug-fix for `Navigator.pop`
12. The `AsyncValue.guard` method
13. Adding an `AsyncValue` extension method
14. Using the `authStateChangesProvider` in `HomeAppBar`
15. Intro to the email & password sign-in screen
16. How to generate immutable state classes in Dart
17. Using `AsyncValue` inside `EmailPasswordSignInState`
18. Implementing the `EmailPasswordSignInController`
19. Using the `EmailPasswordSignInController` in the widget class
20. Bug fix + filtering state updates with `select()`
21. GoRouter redirects
22. GoRouter: the `refreshListenable` argument
23. Wrap Up

### 6. Automated Testing - Part 1

1. Section Intro
2. Introduction to Automated Testing and the Testing Pyramid
3. Getting started with automated testing
4. Writing the first unit test + adding `toString()` and equality implementations
5. Test matchers and working with methods that throw exceptions
6. Fixing the `getProduct()` method and updating the unit tests
7. Working with groups and testing Futures and Streams
8. Adding an optional delay to the `FakeProductsRepository`
9. How to generate a Flutter test coverage report in VSCode
10. Testing the `FakeAuthRepository` (part 1)
11. Testing the `FakeAuthRepository` (part 2) + advanced stream matchers
12. Mocks vs Fakes + installing the mocktail package
13. Testing the `AccountScreenController` (part 1) + `AsyncValue` subclasses
14. Testing the `AccountScreenController` (part 2) + working with mocks
15. Testing the `AccountScreenController` (part 3) + type matchers
16. Testing with Stream Matchers and Predicates
17. Testing lifecycle methods (`setUp`, `tearDown`, `setUpAll`, `tearDownAll`)
18. Testing the `EmailPasswordSignInController` with acceptance criteria
19. Testing the `EmailPasswordSignInController` (part 2)
20. Tip: setting custom test timeouts per-file
21. Adding a test workflow to automate testing with GitHub Actions
22. Wrap up

### 7. Automated Testing - Part 2

1. Section Intro
2. Introduction to widget tests + starter project
3. Writing our first widget test using `pumpWidget()`
4. Working with `WidgetTester` and finder
5. Robot testing
6. How to find widgets by key
7. Writing widget tests with mocks and provider overrides
8. Writing widget tests with `Future.delayed()` and `runAsync()`
9. Adding the email & password widget tests
10. Adding the email & password widget tests (part 2)
11. Test setup for the authentication flow + using `pumpAndSettle()`
12. Fixing the RenderFlex overflow error
13. Completing the authentication flow test
14. Integration tests
15. Golden image tests
16. Running golden image tests with size variants
17. How to deal with holden image tests failing on CI
18. Wrap Up

### 8. Feature: Shopping Cart

1. Section Intro
2. Overview of the shopping cart feature + technical requirements
3. App Architecture for the shopping cart feature
4. Starter project + overview of the data and domain layers
5. Local data persistence with Sembast: Initial setup
6. How to persist the shopping cart data with the `SembastCartRepository`
7. Implementing the `CartService` class
8. Updating the `CartService` class to read dependencies using `Ref`
9. Writing unit tests using `ProviderContainer`
10. Writing the unit tests for the `CartService` class
11. Implementing the `AddToCartController`
12. Updating the `AddToCartWidget`
13. Bug Fix: Adding `autoDispose` to the `AddToCartController`
14. Showing the cart items in the `ShoppingCartScreen` + AutoDispose vs AlwaysAlive error when combining providers
15. Implementing the `ShoppingCartItemController`
16. Updating the `EditOrRemoveItemWidget` and `ShoppingCartScreen` widgets
17. Calculating and showing the cart items count
18. Calculating and showing the cart total price
19. Limiting the available quantity when adding items to the shopping cart
20. Implementing the `CartSyncService` with a listener
21. Registering the `CartSyncService` with `ProviderContainer` when the app starts
22. Implementing the logic inside the `CartSyncService`
23. Implementing the logic inside the `CartSyncService` (part 2 - optional)
24. Unit tests for the `CartSyncService`
25. Unit-testing providers with dependencies using `ProviderContainer`
26. Updated widget and integration tests
27. Wrap up + exercise (implement a wish list feature)

### 9. Feature: Checkout Flows

1. Section intro
2. Starter project for the checkout flows
3. Updating the `CheckoutScreen` with the `PageController` initialization logic
4. Do we need a `StateNotifier` for the `CheckoutScreen`?
5. Updating the `PaymentPage`
6. Implementing the `PaymentButtonController`
7. Wrap Up

### 10. Error Handling

1. Intro
2. Errors vs exceptions
3. Starter project overview + defining custom exceptions with enums
4. Using sealed classes to define exception types
5. Using the `AppException` sealed class in the `FakeAuthRepository`
6. Adding an `AsyncErrorLogger` using `ProviderObserver`
7. Creating a reusable `ErrorLogger` to catch all exceptions
8. Completing the error handling system
9. Working with the `Result` type (`Success` and `Error`)
10. Drawbacks of the `Result` type (and when not to use it)
11. Wrap Up

### 11. Feature: Product Reviews

1. Section Intro
2. Starter project overview
3. Overview of the `LeaveReviewScreen`
4. Implemeting a `LeaveReviewController` and submitting form data
5. Testing the `LeaveReviewForm` and preventing an `AssertionError`
6. Dismissing the `LeaveReviewScreen` programmatically on success using a callback
7. How to prefill a form with data from a repository/backend
8. Optimization: only submit the form if the data has changed
9. Showing existing reviews in the `ProductReviewsList`
10. Updating the `LeaveReviewAction` by reading read data from the `userPurchaseProvider`
11. Calculating the average product ratings
12. Updated tests & wrap up

### 12. Feature: Products Search

1. Section Intro
2. Client-side vs server-side search
3. Adding a search method to the `FakeProductsRepository`
4. Implementing client-side search with `StateProvider` and `FutureProvider`
5. Riverpod caching with `autoDispose`, `keepAlive()` and `Timer`
6. Debouncing and cancelling network requests

### 13. New Riverpod 2.x APIs & Riverpod Generator

1. Introduction to Riverpod 2.x
2. Starter project and updated code walkthrough
3. Installing the Riverpod Generator package
4. Generating providers with the `@riverpod` syntax
5. Migrating some more providers to Riverpod Generator + the `keepAlive` syntax
6. Migrating the `AccountScreenController` from `StateNotifier` to `AsyncNotifier`
7. Converting the `AccountScreenController` to use Riverpod Generator
8. How to check if an `AsyncNotifier` is mounted
9. How to write unit tests for `AsyncNotifier` subclasses
10. Wrap Up
11. Conclusion & Next Steps

### [LICENSE: MIT](LICENSE.md)