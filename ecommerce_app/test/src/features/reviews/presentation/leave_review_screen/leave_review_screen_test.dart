import 'package:flutter_test/flutter_test.dart';

import '../../../../robot.dart';

void main() {
  Future<void> purchaseOneProduct(Robot r) async {
    // add to cart
    await r.products.selectProduct();
    await r.products.setProductQuantity(3);
    await r.cart.addToCart();
    await r.cart.openCart();
    r.cart.expectFindNCartItems(1);
    // checkout
    await r.checkout.startCheckout();
    await r.auth.enterAndSubmitEmailAndPassword();
    r.cart.expectFindNCartItems(1);
    await r.checkout.startPayment();
    // when a payment is complete, user is taken to the orders page
    r.orders.expectFindNOrders(1);
    await r.closePage(); // close orders page
  }

  testWidgets('purchase product, leave review, update it', (tester) async {
    // * Note: All tests are wrapped with `runAsync` to prevent this error:
    // * A Timer is still pending even after the widget tree was disposed.
    await tester.runAsync(() async {
      final r = Robot(tester);
      await r.pumpMyApp();
      await purchaseOneProduct(r);
      await r.products.selectProduct();
      // leave review
      r.reviews.expectFindLeaveReview();
      await r.reviews.tapLeaveReviewButton();
      await r.reviews.createAndSubmitReview('Love it!');
      r.reviews.expectFindOneReview();
      r.reviews.expectFindText('Love it!');
      // update review
      r.reviews.expectFindUpdateReview();
      await r.reviews.tapUpdateReviewButton();
      await r.reviews.updateAndSubmitReview('Great!');
      r.reviews.expectFindOneReview();
      r.reviews.expectFindText('Great!');
    });
  });
}
