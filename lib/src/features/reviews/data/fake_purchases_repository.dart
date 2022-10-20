import 'package:ecommerce_app/src/features/reviews/domain/purchase.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:ecommerce_app/src/utils/delay.dart';
import 'package:ecommerce_app/src/utils/in_memory_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A repository to store all user purchases for all products
/// This makes it easy to find a [Purchase] for a given [ProductID] and user ID
class FakePurchasesRepository {
  FakePurchasesRepository({this.addDelay = true});
  final bool addDelay;

  /// Purchases Store
  /// This is similar to the store in the [FakeOrdersRepository], with the
  /// difference that the data can be easily indexed by [ProductID], rather than
  /// by user ID
  ///
  /// key: [ProductID]
  /// value: map of [Purchase] values for each user ID
  final _purchases = InMemoryStore<Map<ProductID, Map<String, Purchase>>>({});

  /// Product purchase information for a given user
  /// This can be used to show the purchase date in the product page UI,
  /// given the productId and the user uid
  Stream<Purchase?> watchUserPurchase(ProductID id, String uid) {
    return _purchases.stream.map((purchasesData) {
      // access nested maps by productId, then uid
      return purchasesData[id]?[uid];
    });
  }

  /// Submit a new purchase for a given product
  /// @param productId the product identifier
  /// @param uid the identifier of the user who is making the purchase
  /// @param purchase a [Purchase] object with the review information
  Future<void> addPurchase({
    required ProductID productId,
    required String uid,
    required Purchase purchase,
  }) async {
    await delay(addDelay);
    final value = _purchases.value;
    final productPurchases = value[productId];
    if (productPurchases != null) {
      // purchases already exist: set the new purchase for the given uid
      productPurchases[uid] = purchase;
    } else {
      // purchases do not exist: create a new map with the new purchase
      value[productId] = {uid: purchase};
    }
    _purchases.value = value;
  }
}

final purchasesRepositoryProvider = Provider<FakePurchasesRepository>((ref) {
  return FakePurchasesRepository();
});
