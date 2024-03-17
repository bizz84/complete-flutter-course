import 'dart:developer';

import 'package:ecommerce_app/src/features/account/account_screen.dart';
import 'package:ecommerce_app/src/features/checkout/checkout_screen.dart';
import 'package:ecommerce_app/src/features/leave_review_page/leave_review_screen.dart';
import 'package:ecommerce_app/src/features/not_found/not_found_screen.dart';
import 'package:ecommerce_app/src/features/orders_list/orders_list_screen.dart';
import 'package:ecommerce_app/src/features/product_page/product_screen.dart';
import 'package:ecommerce_app/src/features/products_list/products_list_screen.dart';
import 'package:ecommerce_app/src/features/sign_in/email_password_sign_in_screen.dart';
import 'package:ecommerce_app/src/features/sign_in/email_password_sign_in_state.dart';
import 'package:ecommerce_app/src/models/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/route_names.dart';
import '../features/shopping_cart/shopping_cart_screen.dart';

final productRoute = GoRoute(
    name: RouteNames.product,
    path: 'product_screen/:id',
    pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: ProductScreen(productId: state.pathParameters['id']!)
    ),
    routes: [
      GoRoute(
      name: RouteNames.review,
      path: 'leave_review',
      pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          fullscreenDialog: true,
          child: LeaveReviewScreen(productId: state.pathParameters['id']!)
      )
    )
  ]
);

final router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    errorPageBuilder: (context, state) => const MaterialPage(child: NotFoundScreen()),
    routes: [
      GoRoute(
        name: RouteNames.home,
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(child: ProductsListScreen()),
        routes: [
          productRoute,
          GoRoute(
            name: RouteNames.cart,
            path: 'shopping_cart',
            pageBuilder: (context, state) {
              log('state.pageKey = ${state.pageKey}');
              return MaterialPage(
                  key: state.pageKey,
                  child: const ShoppingCartScreen()
              );
            },
            routes: [
              GoRoute(
                  name: RouteNames.checkout,
                  path: 'checkout',
                  pageBuilder: (context, state) => MaterialPage(
                      key: state.pageKey,
                      fullscreenDialog: true,
                      child: const CheckoutScreen()
                  )
              ),
            ]
          ),
          GoRoute(
            name: RouteNames.orders,
            path: 'orders',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const OrdersListScreen()
            )
          ),
          GoRoute(
            name: RouteNames.account,
            path: 'account',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const AccountScreen(),
            )
          ),
        ],
      ),
      GoRoute(
        name: RouteNames.signIn,
        path: '/sign_in_screen',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: EmailPasswordSignInScreen(formType: state.extra as EmailPasswordSignInFormType)
        )
      ),
    ],
);