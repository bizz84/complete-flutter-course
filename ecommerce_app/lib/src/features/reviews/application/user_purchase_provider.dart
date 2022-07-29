import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:ecommerce_app/src/features/reviews/data/fake_purchases_repository.dart';
import 'package:ecommerce_app/src/features/reviews/domain/purchase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Check if a product was previously purchased by the user
final userPurchaseProvider =
    StreamProvider.autoDispose.family<Purchase?, ProductID>((ref, productId) {
  final user = ref.watch(authStateChangesProvider).value;
  if (user != null) {
    return ref
        .watch(purchasesRepositoryProvider)
        .watchUserPurchase(productId, user.uid);
  } else {
    return Stream.value(null);
  }
});
