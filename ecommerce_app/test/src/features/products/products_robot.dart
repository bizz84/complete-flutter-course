import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/presentation/products_list/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ProductsRobot {
  ProductsRobot(this.tester);
  final WidgetTester tester;

  // products list
  Future<void> selectProduct({int atIndex = 0}) async {
    final finder = find.byKey(ProductCard.productCardKey);
    await tester.tap(finder.at(atIndex));
    await tester.pumpAndSettle();
  }

  void expectFindAllProductCards() {
    final finder = find.byType(ProductCard);
    expect(finder, findsNWidgets(kTestProducts.length));
  }

  void expectFindNProductCards(int count) {
    final finder = find.byType(ProductCard);
    expect(finder, findsNWidgets(count));
  }

  // product page
  Future<void> setProductQuantity(int quantity) async {
    final finder = find.byIcon(Icons.add);
    expect(finder, findsOneWidget);
    for (var i = 1; i < quantity; i++) {
      await tester.tap(finder);
      await tester.pumpAndSettle();
    }
  }
}
