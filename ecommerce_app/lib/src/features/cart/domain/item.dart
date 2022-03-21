import 'package:ecommerce_app/src/features/products/domain/product.dart';

/// A product along with a quantity that can be added to an order/cart
class Item {
  const Item({
    required this.productId,
    required this.quantity,
  });
  final ProductID productId;
  final int quantity;
}
