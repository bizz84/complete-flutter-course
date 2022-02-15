import 'package:ecommerce_app/src/features/checkout/checkout_screen.dart';
import 'package:ecommerce_app/src/localization/string_hardcoded.dart';
import 'package:ecommerce_app/src/models/item.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:ecommerce_app/src/features/shopping_cart/shopping_cart_item.dart';
import 'package:ecommerce_app/src/features/shopping_cart/shopping_cart_items_builder.dart';

/// Shopping cart screen showing the items in the cart (with editable
/// quantities) and a button to checkout.
class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'.hardcoded),
      ),
      body: ShoppingCartItemsBuilder(
        items: cartItemsList,
        itemBuilder: (_, item, index) => ShoppingCartItem(
          item: item,
          itemIndex: index,
        ),
        ctaBuilder: (_) => PrimaryButton(
          text: 'Checkout'.hardcoded,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (_) => const CheckoutScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
