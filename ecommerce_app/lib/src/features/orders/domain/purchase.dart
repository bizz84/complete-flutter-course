import 'package:ecommerce_app/src/features/orders/domain/order.dart';

/// Model class containing order details that need to be shown in the product
/// page if the product was purchased by the current user.
class Purchase {
  const Purchase({
    required this.orderId,
    required this.orderDate,
  });
  final OrderID orderId;
  final DateTime orderDate;
}
