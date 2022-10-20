import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:ecommerce_app/src/features/cart/domain/item.dart';
import 'package:ecommerce_app/src/features/cart/domain/mutable_cart.dart';

void main() {
  group('set item', () {
    test('empty cart - set item with quantity', () {
      final cart =
          const Cart().setItem(const Item(productId: '1', quantity: 2));
      expect(cart.items, {'1': 2});
    });
    test('cart with same item - override quantity', () {
      final cart = const Cart()
          .addItem(const Item(productId: '1', quantity: 1))
          .setItem(const Item(productId: '1', quantity: 2));
      expect(cart.items, {'1': 2});
    });
    test('cart with different item - set item with quantity', () {
      final cart = const Cart()
          .addItem(const Item(productId: '2', quantity: 1))
          .setItem(const Item(productId: '1', quantity: 2));
      expect(cart.items, {
        '2': 1,
        '1': 2,
      });
    });
  });

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

  group('add items', () {
    test('empty cart - add two items', () {
      final cart = const Cart().addItems([
        const Item(productId: '1', quantity: 1),
        const Item(productId: '2', quantity: 1),
      ]);
      expect(cart.items, {
        '1': 1,
        '2': 1,
      });
    });
    test('cart with one item - add two items of which one matching', () {
      final cart = const Cart()
          .addItem(const Item(productId: '1', quantity: 1))
          .addItems([
        const Item(productId: '1', quantity: 1),
        const Item(productId: '2', quantity: 1),
      ]);
      expect(cart.items, {
        '1': 2,
        '2': 1,
      });
    });
    test('cart with one item - add two new items', () {
      final cart = const Cart()
          .addItem(const Item(productId: '1', quantity: 1))
          .addItems([
        const Item(productId: '2', quantity: 1),
        const Item(productId: '3', quantity: 1),
      ]);
      expect(cart.items, {
        '1': 1,
        '2': 1,
        '3': 1,
      });
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
}
