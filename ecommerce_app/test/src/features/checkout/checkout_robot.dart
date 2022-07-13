import 'package:flutter_test/flutter_test.dart';

class CheckoutRobot {
  CheckoutRobot(this.tester);
  final WidgetTester tester;

  Future<void> startCheckout() async {
    final finder = find.text('Checkout');
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  // payment
  Future<void> startPayment() async {
    final finder = find.text('Pay');
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  void expectPayButtonFound() {
    final finder = find.text('Pay');
    expect(finder, findsOneWidget);
  }
}
