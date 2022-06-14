import 'dart:convert';

import 'package:ecommerce_app/src/features/cart/domain/item.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';

/// Model class representing the shopping cart contents.
class Cart {
  const Cart([this.items = const {}]);

  /// All the items in the shopping cart, where:
  /// - key: product ID
  /// - value: quantity
  final Map<ProductID, int> items;

  Map<String, dynamic> toMap() {
    return {
      'items': items,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      Map<ProductID, int>.from(map['items']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() => 'Cart(items: $items)';
}

extension CartItems on Cart {
  List<Item> toItemsList() {
    return items.entries.map((entry) {
      return Item(
        productId: entry.key,
        quantity: entry.value,
      );
    }).toList();
  }
}
