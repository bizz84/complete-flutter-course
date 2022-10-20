import 'dart:async';

import 'package:ecommerce_app/src/app.dart';
import 'package:ecommerce_app/src/exceptions/async_error_logger.dart';
import 'package:ecommerce_app/src/exceptions/error_logger.dart';
import 'package:ecommerce_app/src/features/cart/application/cart_sync_service.dart';
import 'package:ecommerce_app/src/features/cart/data/local/local_cart_repository.dart';
import 'package:ecommerce_app/src/features/cart/data/local/sembast_cart_repository.dart';
import 'package:ecommerce_app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() async {
  late ErrorLogger errorLogger;
  // * For more info on error handling, see:
  // * https://docs.flutter.dev/testing/errors
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // turn off the # in the URLs on the web
    GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
    final localCartRepository = await SembastCartRepository.makeDefault();
    // * Create ProviderContainer with any required overrides
    final container = ProviderContainer(
      overrides: [
        localCartRepositoryProvider.overrideWithValue(localCartRepository),
      ],
      observers: [AsyncErrorLogger()],
    );
    errorLogger = container.read(errorLoggerProvider);
    // * Initialize CartSyncService to start the listener
    container.read(cartSyncServiceProvider);
    // * Entry point of the app
    runApp(UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ));

    // * This code will present some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('An error occurred'.hardcoded),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
  });
}
