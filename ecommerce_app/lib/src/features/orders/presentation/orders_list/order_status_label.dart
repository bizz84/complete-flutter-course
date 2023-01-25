import 'package:ecommerce_app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/features/orders/domain/order.dart';

/// Shows the status of the order
class OrderStatusLabel extends StatelessWidget {
  const OrderStatusLabel({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge!;
    switch (order.orderStatus) {
      case OrderStatus.confirmed:
        return Text(
          'Confirmed - preparing for delivery'.hardcoded,
          style: textStyle,
        );
      case OrderStatus.shipped:
        return Text(
          'Shipped'.hardcoded,
          style: textStyle,
        );
      case OrderStatus.delivered:
        return Text(
          'Delivered'.hardcoded,
          style: textStyle.copyWith(color: Colors.green),
        );
    }
  }
}
