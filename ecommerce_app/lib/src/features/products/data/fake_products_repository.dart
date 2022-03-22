import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';

class FakeProductsRepository {
  FakeProductsRepository._();
  static FakeProductsRepository instance = FakeProductsRepository._();
  List<Product> getProductsList() {
    return kTestProducts;
  }

  Product? getProduct(String id) {
    return kTestProducts.firstWhere((product) => product.id == id);
  }
}
