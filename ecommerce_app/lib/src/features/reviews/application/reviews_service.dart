import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:ecommerce_app/src/features/reviews/data/fake_reviews_repository.dart';
import 'package:ecommerce_app/src/features/reviews/domain/review.dart';
import 'package:ecommerce_app/src/localization/string_hardcoded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reviews_service.g.dart';

class ReviewsService {
  ReviewsService(this.ref);
  final Ref ref;

  Future<void> submitReview({
    required ProductID productId,
    required Review review,
  }) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    // * we should only call this method when the user is signed in
    assert(user != null);
    if (user == null) {
      throw AssertionError(
          'Can\'t submit a review if the user is not signed in'.hardcoded);
    }
    await ref.read(reviewsRepositoryProvider).setReview(
          productId: productId,
          uid: user.uid,
          review: review,
        );
    // * Note: this should be done on the backend
    // * At this stage the review is already submitted
    // * and we don't need to await for the product rating to also be updated
    _updateProductRating(productId);
  }

  Future<void> _updateProductRating(ProductID productId) async {
    final reviews =
        await ref.read(reviewsRepositoryProvider).fetchReviews(productId);
    final avgRating = _avgReviewScore(reviews);
    final product = ref.read(productsRepositoryProvider).getProduct(productId);
    if (product == null) {
      throw StateError('Product not found with id: $productId.'.hardcoded);
    }
    final updated = product.copyWith(
      avgRating: avgRating,
      numRatings: reviews.length,
    );
    await ref.read(productsRepositoryProvider).setProduct(updated);
  }

  double _avgReviewScore(List<Review> reviews) {
    if (reviews.isNotEmpty) {
      var total = 0.0;
      for (var review in reviews) {
        total += review.rating;
      }
      return total / reviews.length;
    } else {
      return 0.0;
    }
  }
}

@Riverpod(keepAlive: true)
ReviewsService reviewsService(ReviewsServiceRef ref) {
  return ReviewsService(ref);
}

/// Check if a product was previously reviewed by the user
@riverpod
Future<Review?> userReviewFuture(UserReviewFutureRef ref, ProductID id) {
  final user = ref.watch(authStateChangesProvider).value;
  if (user != null) {
    return ref.watch(reviewsRepositoryProvider).fetchUserReview(id, user.uid);
  } else {
    return Future.value(null);
  }
}

/// Check if a product was previously reviewed by the user
@riverpod
Stream<Review?> userReviewStream(UserReviewStreamRef ref, ProductID id) {
  final user = ref.watch(authStateChangesProvider).value;
  if (user != null) {
    return ref.watch(reviewsRepositoryProvider).watchUserReview(id, user.uid);
  } else {
    return Stream.value(null);
  }
}
