import 'package:ecommerce_app/src/features/orders/domain/order.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:ecommerce_app/src/utils/delay.dart';
import 'package:ecommerce_app/src/utils/in_memory_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fake_orders_repository.g.dart';

class FakeOrdersRepository {
  FakeOrdersRepository({this.addDelay = true});
  final bool addDelay;

  /// A map of all the orders placed by each user, where:
  /// - key: user ID
  /// - value: list of orders for that user
  final _orders = InMemoryStore<Map<String, List<Order>>>({});

  /// A stream that returns all the orders for a given user, ordered by date
  /// Only user orders that match the given productId will be returned.
  /// If a productId is not passed, all user orders will be returned.
  Stream<List<Order>> watchUserOrders(String uid, {ProductID? productId}) {
    return _orders.stream.map((ordersData) {
      final ordersList = ordersData[uid] ?? [];
      ordersList.sort(
        (lhs, rhs) => rhs.orderDate.compareTo(lhs.orderDate),
      );
      if (productId != null) {
        return ordersList
            .where((order) => order.items.keys.contains(productId))
            .toList();
      } else {
        return ordersList;
      }
    });
  }

  // A method to add a new order to the list for a given user
  Future<void> addOrder(String uid, Order order) async {
    await delay(addDelay);
    final value = _orders.value;
    final userOrders = value[uid] ?? [];
    userOrders.add(order);
    value[uid] = userOrders;
    _orders.value = value;
  }
}

@Riverpod(keepAlive: true)
FakeOrdersRepository ordersRepository(OrdersRepositoryRef ref) {
  return FakeOrdersRepository();
}
