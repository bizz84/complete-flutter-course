import 'package:flutter_test/flutter_test.dart';
import '../../../../robot.dart';

void main() {
  group('shopping cart', () {
    // * Note: All tests are wrapped with `runAsync` to prevent this error:
    // * A Timer is still pending even after the widget tree was disposed.
    testWidgets('Empty shopping cart', (tester) async {
      await tester.runAsync(() async {
        final r = Robot(tester);
        await r.pumpMyApp();
        r.products.expectFindNProductCards(14); // check all products are found
        await r.cart.openCart();
        r.cart.expectShoppingCartIsEmpty();
      });
    });

    testWidgets('Add product with quantity = 1', (tester) async {
      await tester.runAsync(() async {
        final r = Robot(tester);
        await r.pumpMyApp();
        await r.products.selectProduct();
        await r.cart.addToCart();
        await r.cart.openCart();
        r.cart.expectItemQuantity(quantity: 1, atIndex: 0);
        r.cart.expectShoppingCartTotalIs('Total: \$15.00');
      });
    });

    testWidgets('Add product with quantity = 5', (tester) async {
      await tester.runAsync(() async {
        final r = Robot(tester);
        await r.pumpMyApp();
        await r.products.selectProduct();
        await r.products.setProductQuantity(5);
        await r.cart.addToCart();
        await r.cart.openCart();
        r.cart.expectItemQuantity(quantity: 5, atIndex: 0);
        r.cart.expectShoppingCartTotalIs('Total: \$75.00');
      });
    });

    testWidgets('Add product with quantity = 6', (tester) async {
      await tester.runAsync(() async {
        final r = Robot(tester);
        await r.pumpMyApp();
        await r.products.selectProduct();
        await r.products.setProductQuantity(6);
        await r.cart.addToCart();
        await r.cart.openCart();
        r.cart.expectItemQuantity(quantity: 5, atIndex: 0);
        r.cart.expectShoppingCartTotalIs('Total: \$75.00');
      });
    });

    testWidgets('Add product with quantity = 2, then increment by 2',
        (tester) async {
      await tester.runAsync(() async {
        final r = Robot(tester);
        await r.pumpMyApp();
        await r.products.selectProduct();
        await r.products.setProductQuantity(2);
        await r.cart.addToCart();
        await r.cart.openCart();
        await r.cart.incrementCartItemQuantity(quantity: 2, atIndex: 0);
        r.cart.expectItemQuantity(quantity: 4, atIndex: 0);
        r.cart.expectShoppingCartTotalIs('Total: \$60.00');
      });
    });

    testWidgets('Add product with quantity = 5, then decrement by 2',
        (tester) async {
      await tester.runAsync(() async {
        final r = Robot(tester);
        await r.pumpMyApp();
        await r.products.selectProduct();
        await r.products.setProductQuantity(5);
        await r.cart.addToCart();
        await r.cart.openCart();
        await r.cart.decrementCartItemQuantity(quantity: 2, atIndex: 0);
        r.cart.expectItemQuantity(quantity: 3, atIndex: 0);
        r.cart.expectShoppingCartTotalIs('Total: \$45.00');
      });
    });

    testWidgets('Add two products', (tester) async {
      await tester.runAsync(() async {
        final r = Robot(tester);
        await r.pumpMyApp();
        // add first product
        await r.products.selectProduct(atIndex: 0);
        await r.cart.addToCart();
        await r.goBack();
        // add second product
        await r.products.selectProduct(atIndex: 1);
        await r.cart.addToCart();
        await r.cart.openCart();
        r.cart.expectFindNCartItems(2);
        r.cart.expectShoppingCartTotalIs('Total: \$28.00');
      });
    });

    testWidgets('Add product, then delete it', (tester) async {
      await tester.runAsync(() async {
        final r = Robot(tester);
        await r.pumpMyApp();
        await r.products.selectProduct();
        await r.cart.addToCart();
        await r.cart.openCart();
        await r.cart.deleteCartItem(atIndex: 0);
        r.cart.expectShoppingCartIsEmpty();
      });
    });

    testWidgets('Add product with quantity = 5, goes out of stock',
        (tester) async {
      await tester.runAsync(() async {
        final r = Robot(tester);
        await r.pumpMyApp();
        await r.products.selectProduct();
        await r.products.setProductQuantity(5);
        await r.cart.addToCart();
        r.cart.expectProductIsOutOfStock();
      });
    });

    testWidgets(
        'Add product with quantity = 5, remains out of stock when opened again',
        (tester) async {
      await tester.runAsync(() async {
        final r = Robot(tester);
        await r.pumpMyApp();
        await r.products.selectProduct();
        await r.products.setProductQuantity(5);
        await r.cart.addToCart();
        await r.goBack();
        await r.products.selectProduct();
        r.cart.expectProductIsOutOfStock();
      });
    });
  });
}
