import 'package:ecommerce_app/src/features/orders/presentation/orders_list/order_item_list_tile.dart';
import 'package:ecommerce_app/src/features/orders/presentation/orders_list/order_status_label.dart';
import 'package:ecommerce_app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/constants/app_sizes.dart';
import 'package:ecommerce_app/src/features/cart/domain/item.dart';
import 'package:ecommerce_app/src/features/orders/domain/order.dart';
import 'package:ecommerce_app/src/utils/currency_formatter.dart';
import 'package:ecommerce_app/src/utils/date_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Shows all the details for a given order
class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Colors.grey[400]!),
        borderRadius: const BorderRadius.all(Radius.circular(Sizes.p8)),
      ),
      child: Column(
        children: [
          OrderHeader(order: order),
          const Divider(height: 1, color: Colors.grey),
          OrderItemsList(order: order),
        ],
      ),
    );
  }
}

/// Order header showing the following:
/// - Total order amount
/// - Order date
class OrderHeader extends ConsumerWidget {
  const OrderHeader({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalFormatted =
        ref.watch(currencyFormatterProvider).format(order.total);
    final dateFormatted =
        ref.watch(dateFormatterProvider).format(order.orderDate);
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(Sizes.p16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order placed'.hardcoded.toUpperCase(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  gapH4,
                  Text(dateFormatted),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Total'.hardcoded.toUpperCase(),
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  gapH4,
                  Text(totalFormatted),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// List of items in the order
class OrderItemsList extends StatelessWidget {
  const OrderItemsList({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: OrderStatusLabel(order: order),
        ),
        for (var entry in order.items.entries)
          OrderItemListTile(
            item: Item(productId: entry.key, quantity: entry.value),
          ),
      ],
    );
  }
}
