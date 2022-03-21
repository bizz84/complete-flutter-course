import 'package:ecommerce_app/src/utils/currency_formatter.dart';
import 'package:flutter/material.dart';

/// Text widget for showing the total price of the cart
class CartTotalText extends StatelessWidget {
  const CartTotalText({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Read from data source
    const cartTotal = 104.0;
    // TODO: Inject formatter
    final totalFormatted = kCurrencyFormatter.format(cartTotal);
    return Text(
      'Total: $totalFormatted',
      style: Theme.of(context).textTheme.headlineSmall,
      textAlign: TextAlign.center,
    );
  }
}
