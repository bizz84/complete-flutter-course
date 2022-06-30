import 'package:ecommerce_app/src/common_widgets/item_quantity_selector.dart';
import 'package:ecommerce_app/src/features/cart/presentation/shopping_cart/shopping_cart_item.dart';
import 'package:ecommerce_app/src/features/products/presentation/home_app_bar/shopping_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class CartRobot {
  CartRobot(this.tester);
  final WidgetTester tester;

  Future<void> addToCart() async {
    final finder = find.text('Add to Cart');
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  // shopping cart
  Future<void> openCart() async {
    final finder = find.byKey(ShoppingCartIcon.shoppingCartIconKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  void expectProductIsOutOfStock() async {
    final finder = find.text('Out of Stock');
    expect(finder, findsOneWidget);
  }

  Future<void> incrementCartItemQuantity(
      {required int quantity, required int atIndex}) async {
    final finder = find.byKey(ItemQuantitySelector.incrementKey(atIndex));
    expect(finder, findsOneWidget);
    for (var i = 0; i < quantity; i++) {
      await tester.tap(finder);
      await tester.pumpAndSettle();
    }
  }

  Future<void> decrementCartItemQuantity(
      {required int quantity, required int atIndex}) async {
    final finder = find.byKey(ItemQuantitySelector.decrementKey(atIndex));
    expect(finder, findsOneWidget);
    for (var i = 0; i < quantity; i++) {
      await tester.tap(finder);
      await tester.pumpAndSettle();
    }
  }

  Future<void> deleteCartItem({required int atIndex}) async {
    final finder = find.byKey(ShoppingCartItemContents.deleteKey(atIndex));
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  void expectShoppingCartIsLoading() {
    final finder = find.byType(CircularProgressIndicator);
    expect(finder, findsOneWidget);
  }

  void expectShoppingCartIsEmpty() {
    final finder = find.text('Your shopping cart is empty');
    expect(finder, findsOneWidget);
  }

  void expectFindZeroCartItems() {
    final finder = find.byType(ShoppingCartItem);
    expect(finder, findsNothing);
  }

  void expectFindNCartItems(int count) {
    final finder = find.byType(ShoppingCartItem);
    expect(finder, findsNWidgets(count));
  }

  Text getItemQuantityWidget({int? atIndex}) {
    final finder = find.byKey(ItemQuantitySelector.quantityKey(atIndex));
    expect(finder, findsOneWidget);
    return finder.evaluate().single.widget as Text;
  }

  void expectItemQuantity({required int quantity, int? atIndex}) {
    final text = getItemQuantityWidget(atIndex: atIndex);
    expect(text.data, '$quantity');
  }

  void expectShoppingCartTotalIs(String text) {
    final finder = find.text(text);
    expect(finder, findsOneWidget);
  }
}
