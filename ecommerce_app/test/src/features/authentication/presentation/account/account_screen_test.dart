import 'package:flutter_test/flutter_test.dart';

import '../../auth_robot.dart';

void main() {
  testWidgets('Cancel logout', (tester) async {
    final r = AuthRobot(tester);
    await r.pumpAccountScreen();
    await r.tapLogoutButton();
    r.expectLogoutDialogFound();
    await r.tapCancelButton();
    r.expectLogoutDialogNotFound();
  });
  testWidgets('Confirm logout success', (tester) async {
    final r = AuthRobot(tester);
    await r.pumpAccountScreen();
    await r.tapLogoutButton();
    r.expectLogoutDialogFound();
    await r.tapDialogLogoutButton();
    r.expectLogoutDialogNotFound();
  });
}
