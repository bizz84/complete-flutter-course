import 'dart:async';

import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:ecommerce_app/src/features/reviews/application/reviews_service.dart';
import 'package:ecommerce_app/src/features/reviews/domain/review.dart';
import 'package:ecommerce_app/src/utils/current_date_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leave_review_controller.g.dart';

@riverpod
class LeaveReviewController extends _$LeaveReviewController {
  bool mounted = true;
  @override
  FutureOr<void> build() {
    // ok to leave this empty if the return type is FutureOr<void>
    ref.onDispose(() => mounted = false);
  }

  Future<void> submitReview({
    Review? previousReview,
    required ProductID productId,
    required double rating,
    required String comment,
    required void Function() onSuccess,
  }) async {
    // * if nothing has changed
    if (previousReview != null &&
        rating == previousReview.rating &&
        comment == previousReview.comment) {
      // * fire callback and return
      onSuccess();
      return;
    }
    // * else submit
    final currentDateBuilder = ref.read(currentDateBuilderProvider);
    final reviewsService = ref.read(reviewsServiceProvider);
    final review = Review(
      rating: rating,
      comment: comment,
      date: currentDateBuilder(),
    );
    state = const AsyncLoading();
    final newState = await AsyncValue.guard(() =>
        reviewsService.submitReview(productId: productId, review: review));
    if (mounted) {
      // * only set the state if the controller hasn't been disposed
      state = newState;
      if (state.hasError == false) {
        onSuccess();
      }
    }
  }
}
