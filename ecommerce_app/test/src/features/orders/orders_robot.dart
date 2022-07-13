import 'package:ecommerce_app/src/features/orders/presentation/orders_list/order_card.dart';
import 'package:flutter_test/flutter_test.dart';

class OrdersRobot {
  OrdersRobot(this.tester);
  final WidgetTester tester;

  void expectFindZeroOrders() {
    final finder = find.byType(OrderCard);
    expect(finder, findsNothing);
  }

  void expectFindNOrders(int count) {
    final finder = find.byType(OrderCard);
    expect(finder, findsNWidgets(count));
  }
}
