import 'package:ecommerce_app/src/features/reviews/domain/review.dart';
import 'package:ecommerce_app/src/features/reviews/presentation/leave_review_screen/leave_review_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  final testDate = DateTime(2022, 7, 31);
  const testRating = 5.0;
  const testComment = 'love it!';
  final testReview = Review(
    rating: testRating,
    comment: testComment,
    date: testDate,
  );
  const testProductId = '1';

  late MockReviewsService reviewsService;
  setUp(() {
    reviewsService = MockReviewsService();
  });

  group('submitReview', () {
    test('success', () async {
      // setup
      when(() => reviewsService.submitReview(
            productId: testProductId,
            review: testReview,
          )).thenAnswer((_) => Future.value());
      final controller = LeaveReviewController(
        reviewsService: reviewsService,
        currentDateBuilder: () => testDate,
      );
      // run & verify
      var didSucceed = false;
      expectLater(
        controller.stream,
        emitsInOrder([
          const AsyncLoading<void>(),
          const AsyncData<void>(null),
        ]),
      );
      await controller.submitReview(
        previousReview: null,
        rating: testRating,
        comment: testComment,
        productId: testProductId,
        onSuccess: () => didSucceed = true,
      );
      verify(() => reviewsService.submitReview(
            productId: testProductId,
            review: testReview,
          )).called(1);
      expect(didSucceed, true);
    });

    test('failure', () async {
      // setup
      when(() => reviewsService.submitReview(
            productId: testProductId,
            review: testReview,
          )).thenThrow(Exception('Connection failed'));
      final controller = LeaveReviewController(
        reviewsService: reviewsService,
        currentDateBuilder: () => testDate,
      );
      // run & verify
      var didSucceed = false;
      expectLater(
        controller.stream,
        emitsInOrder([
          const AsyncLoading<void>(),
          predicate<AsyncValue<void>>(
            (value) {
              expect(value.hasError, true);
              return true;
            },
          )
        ]),
      );
      await controller.submitReview(
        previousReview: null,
        rating: testRating,
        comment: testComment,
        productId: testProductId,
        onSuccess: () => didSucceed = true,
      );
      verify(() => reviewsService.submitReview(
            productId: testProductId,
            review: testReview,
          )).called(1);
      expect(didSucceed, false);
    });

    test('same data as before', () async {
      // setup
      when(() => reviewsService.submitReview(
            productId: testProductId,
            review: testReview,
          )).thenThrow(Exception('Connection failed'));
      final controller = LeaveReviewController(
        reviewsService: reviewsService,
        currentDateBuilder: () => testDate,
      );
      // run & verify
      var didSucceed = false;
      expectLater(
        controller.stream,
        emitsInOrder([]), // no state changes
      );
      await controller.submitReview(
        previousReview: testReview,
        rating: testRating,
        comment: testComment,
        productId: testProductId,
        onSuccess: () => didSucceed = true,
      );
      verifyNever(() => reviewsService.submitReview(
            productId: testProductId,
            review: testReview,
          ));
      expect(didSucceed, true);
    });
  });
}
