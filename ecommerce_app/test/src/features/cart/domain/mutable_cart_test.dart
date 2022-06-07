import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:ecommerce_app/src/features/cart/domain/item.dart';
import 'package:ecommerce_app/src/features/cart/domain/mutable_cart.dart';

void main() {
  group('add item', () {
    test('empty cart - add item', () {
      final cart =
          const Cart().addItem(const Item(productId: '1', quantity: 1));
      expect(cart.items, {'1': 1});
    });
    test('empty cart - add two items', () {
      final cart = const Cart()
          .addItem(const Item(productId: '1', quantity: 1))
          .addItem(const Item(productId: '2', quantity: 1));
      expect(cart.items, {
        '1': 1,
        '2': 1,
      });
    });
    test('empty cart - add same item twice', () {
      final cart = const Cart()
          .addItem(const Item(productId: '1', quantity: 1))
          .addItem(const Item(productId: '1', quantity: 1));
      expect(cart.items, {'1': 2});
    });
  });
  group('remove item', () {
    test('empty cart - remove item', () {
      final cart = const Cart().removeItemById('1');
      expect(cart.items, {});
    });
    test('empty cart - remove matching item', () {
      final cart = const Cart()
          .addItem(const Item(productId: '1', quantity: 1))
          .removeItemById('1');
      expect(cart.items, {});
    });
    test('empty cart - remove non-matching item', () {
      final cart = const Cart()
          .addItem(const Item(productId: '2', quantity: 1))
          .removeItemById('1');
      expect(cart.items, {'2': 1});
    });
  });

  group('remove all items', () {
    test('some items - all', () {
      final cart = const Cart()
          .addItem(const Item(productId: '1', quantity: 1))
          .addItem(const Item(productId: '2', quantity: 2))
          .clear();
      expect(cart.items, {});
    });
  });

  group('update quantity', () {
    test('empty cart - update quantity', () {
      final cart = const Cart()
          .updateItemIfExists(const Item(productId: '1', quantity: 2));
      expect(cart.items, {});
    });
    test('empty cart - update quantity matching item', () {
      final cart = const Cart()
          .addItem(const Item(productId: '1', quantity: 1))
          .updateItemIfExists(const Item(productId: '1', quantity: 2));
      expect(cart.items, {'1': 2});
    });
    test('empty cart - update quantity non-matching item', () {
      final cart = const Cart()
          .addItem(const Item(productId: '2', quantity: 1))
          .updateItemIfExists(const Item(productId: '1', quantity: 2));
      expect(cart.items, {'2': 1});
    });
  });
}
