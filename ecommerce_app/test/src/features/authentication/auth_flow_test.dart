import 'package:flutter_test/flutter_test.dart';

import '../../robot.dart';

void main() {
  testWidgets('Sign in and sign out flow', (tester) async {
    // * Note: All tests are wrapped with `runAsync` to prevent this error:
    // * A Timer is still pending even after the widget tree was disposed.
    await tester.runAsync(() async {
      final r = Robot(tester);
      await r.pumpMyApp();
      r.products.expectFindAllProductCards();
      await r.openPopupMenu();
      await r.auth.openEmailPasswordSignInScreen();
      await r.auth.tapFormToggleButton();
      await r.auth.enterAndSubmitEmailAndPassword();
      r.products.expectFindAllProductCards();
      await r.openPopupMenu();
      await r.auth.openAccountScreen();
      await r.auth.tapLogoutButton();
      await r.auth.tapDialogLogoutButton();
      r.products.expectFindAllProductCards();
    });
  });
}
