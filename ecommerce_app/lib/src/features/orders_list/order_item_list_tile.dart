import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/common_widgets/custom_image.dart';
import 'package:ecommerce_app/src/constants/app_sizes.dart';
import 'package:ecommerce_app/src/models/item.dart';

/// Shows an individual order item, including price and quantity.
class OrderItemListTile extends StatelessWidget {
  const OrderItemListTile({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    // TODO: Read from data source
    final product =
        kTestProducts.firstWhere((product) => product.id == item.productId);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: CustomImage(imageUrl: product.imageUrl),
          ),
          gapW8,
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title),
                gapH12,
                Text(
                  'Quantity: ${item.quantity}'.hardcoded,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
