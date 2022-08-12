import 'package:flutter_test/flutter_test.dart';

import '../../../../robot.dart';

void main() {
  // * Note: All tests are wrapped with `runAsync` to prevent this error:
  // * A Timer is still pending even after the widget tree was disposed.
  testWidgets('checkout when not previously signed in', (tester) async {
    await tester.runAsync(() async {
      final r = Robot(tester);
      await r.pumpMyApp();
      // add a product and start checkout
      await r.products.selectProduct();
      await r.cart.addToCart();
      await r.cart.openCart();
      await r.checkout.startCheckout();
      // sign in from checkout screen
      r.auth.expectEmailAndPasswordFieldsFound();
      await r.auth.enterAndSubmitEmailAndPassword();
      // check that we move to the payment page
      r.checkout.expectPayButtonFound();
    });
  });

  testWidgets('checkout when previously signed in', (tester) async {
    await tester.runAsync(() async {
      final r = Robot(tester);
      await r.pumpMyApp();
      // create an account first
      await r.auth.openEmailPasswordSignInScreen();
      await r.auth.tapFormToggleButton();
      await r.auth.enterAndSubmitEmailAndPassword();
      // then add a product and start checkout
      await r.products.selectProduct();
      await r.cart.addToCart();
      await r.cart.openCart();
      await r.checkout.startCheckout();
      // expect that we see the payment page right away
      r.checkout.expectPayButtonFound();
    });
  });
}
