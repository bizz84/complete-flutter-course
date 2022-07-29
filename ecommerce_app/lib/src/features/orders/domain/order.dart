import 'package:ecommerce_app/src/exceptions/app_exception.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';

/// Order status
enum OrderStatus { confirmed, shipped, delivered }

/// Helper method to get the order status from String
extension OrderStatusString on OrderStatus {
  static OrderStatus fromString(String string) {
    if (string == 'confirmed') return OrderStatus.confirmed;
    if (string == 'shipped') return OrderStatus.shipped;
    if (string == 'delivered') return OrderStatus.delivered;
    throw ParseOrderFailureException(string);
  }
}

/// * The order identifier is an important concept and can have its own type.
typedef OrderID = String;

/// Model class representing an order placed by the user.
class Order {
  const Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.orderStatus,
    required this.orderDate,
    required this.total,
  });

  /// Unique order ID
  final OrderID id;

  /// ID of the user who made the order
  final String userId;

  /// List of items in that order
  final Map<ProductID, int> items;
  final OrderStatus orderStatus;
  final DateTime orderDate;
  final double total;
}
