import 'package:ecommerce_app/src/features/cart/presentation/shopping_cart/shopping_cart_item.dart';
import 'package:ecommerce_app/src/features/cart/presentation/shopping_cart/shopping_cart_items_builder.dart';
import 'package:ecommerce_app/src/features/checkout/presentation/payment/payment_button.dart';
import 'package:ecommerce_app/src/features/cart/domain/item.dart';
import 'package:flutter/material.dart';

/// Payment screen showing the items in the cart (with read-only quantities) and
/// a button to checkout.
class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Listen to cart changes on checkout and update the UI.
    // TODO: Read from data source
    const cartItemsList = [
      Item(
        productId: '1',
        quantity: 1,
      ),
      Item(
        productId: '2',
        quantity: 2,
      ),
      Item(
        productId: '3',
        quantity: 3,
      ),
    ];

    return ShoppingCartItemsBuilder(
      items: cartItemsList,
      itemBuilder: (_, item, index) => ShoppingCartItem(
        item: item,
        itemIndex: index,
        isEditable: false,
      ),
      ctaBuilder: (_) => const PaymentButton(),
    );
  }
}
