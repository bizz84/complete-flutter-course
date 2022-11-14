import 'package:ecommerce_app/src/features/reviews/application/reviews_service.dart';
import 'package:ecommerce_app/src/features/reviews/domain/review.dart';
import 'package:ecommerce_app/src/features/reviews/presentation/leave_review_screen/leave_review_controller.dart';
import 'package:ecommerce_app/src/utils/current_date_provider.dart';
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

  ProviderContainer makeProviderContainer(MockReviewsService reviewsService) {
    final container = ProviderContainer(
      overrides: [
        reviewsServiceProvider.overrideWithValue(reviewsService),
        currentDateBuilderProvider.overrideWithValue(() => testDate),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('submitReview', () {
    test('success', () async {
      // setup
      final reviewsService = MockReviewsService();
      when(() => reviewsService.submitReview(
            productId: testProductId,
            review: testReview,
          )).thenAnswer((_) => Future.value());
      final container = makeProviderContainer(reviewsService);
      final controller = container.read(leaveReviewControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        leaveReviewControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      var didSucceed = false;
      await controller.submitReview(
        previousReview: null,
        rating: testRating,
        comment: testComment,
        productId: testProductId,
        onSuccess: () => didSucceed = true,
      );
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => reviewsService.submitReview(
            productId: testProductId,
            review: testReview,
          )).called(1);
      expect(didSucceed, true);
    });

    test('failure', () async {
      // setup
      final reviewsService = MockReviewsService();
      when(() => reviewsService.submitReview(
            productId: testProductId,
            review: testReview,
          )).thenThrow(Exception('Connection failed'));
      final container = makeProviderContainer(reviewsService);
      final controller = container.read(leaveReviewControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        leaveReviewControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      var didSucceed = false;
      await controller.submitReview(
        previousReview: null,
        rating: testRating,
        comment: testComment,
        productId: testProductId,
        onSuccess: () => didSucceed = true,
      );
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => reviewsService.submitReview(
            productId: testProductId,
            review: testReview,
          )).called(1);
      expect(didSucceed, false);
    });

    test('same data as before', () async {
      // setup
      final reviewsService = MockReviewsService();
      when(() => reviewsService.submitReview(
            productId: testProductId,
            review: testReview,
          )).thenThrow(Exception('Connection failed'));
      final container = makeProviderContainer(reviewsService);
      final controller = container.read(leaveReviewControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        leaveReviewControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      var didSucceed = false;
      await controller.submitReview(
        previousReview: testReview,
        rating: testRating,
        comment: testComment,
        productId: testProductId,
        onSuccess: () => didSucceed = true,
      );
      verifyNoMoreInteractions(listener);
      verifyNever(() => reviewsService.submitReview(
            productId: testProductId,
            review: testReview,
          ));
      expect(didSucceed, true);
    });
  });
}
