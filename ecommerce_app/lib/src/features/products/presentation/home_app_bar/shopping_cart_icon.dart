import 'package:ecommerce_app/src/features/cart/application/cart_service.dart';
import 'package:ecommerce_app/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/constants/app_sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Shopping cart icon with items count badge
class ShoppingCartIcon extends ConsumerWidget {
  const ShoppingCartIcon({super.key});

  // * Keys for testing using find.byKey()
  static const shoppingCartIconKey = Key('shopping-cart');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemsCount = ref.watch(cartItemsCountProvider);
    return Stack(
      children: [
        Center(
          child: IconButton(
            key: shoppingCartIconKey,
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => context.pushNamed(AppRoute.cart.name),
          ),
        ),
        if (cartItemsCount > 0)
          Positioned(
            top: Sizes.p4,
            right: Sizes.p4,
            child: ShoppingCartIconBadge(itemsCount: cartItemsCount),
          ),
      ],
    );
  }
}

/// Icon badge showing the items count
class ShoppingCartIconBadge extends StatelessWidget {
  const ShoppingCartIconBadge({super.key, required this.itemsCount});
  final int itemsCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.p16,
      height: Sizes.p16,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Text(
          '$itemsCount',
          textAlign: TextAlign.center,
          // * Force textScaleFactor to 1.0 irrespective of the device's
          // * textScaleFactor. This is to prevent the text from growing bigger
          // * than the available space.
          textScaleFactor: 1.0,
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
