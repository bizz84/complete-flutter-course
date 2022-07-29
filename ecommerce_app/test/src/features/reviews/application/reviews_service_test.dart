import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:ecommerce_app/src/features/reviews/application/reviews_service.dart';
import 'package:ecommerce_app/src/features/reviews/data/fake_reviews_repository.dart';
import 'package:ecommerce_app/src/features/reviews/domain/review.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  const testUser = AppUser(uid: 'abc', email: 'abc@test.com');
  const testProductId = '1';
  final testReview =
      Review(rating: 5, comment: '', date: DateTime(2022, 7, 31));
  late MockAuthRepository authRepository;
  late MockReviewsRepository reviewsRepository;
  setUp(() {
    authRepository = MockAuthRepository();
    reviewsRepository = MockReviewsRepository();
  });

  ReviewsService makeReviewsService() {
    final container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(authRepository),
        reviewsRepositoryProvider.overrideWithValue(reviewsRepository),
      ],
    );
    addTearDown(container.dispose);
    return container.read(reviewsServiceProvider);
  }

  group('submitReview', () {
    test('null user, throws', () {
      // setup
      when(() => authRepository.currentUser).thenReturn(null);
      final reviewsService = makeReviewsService();
      // run
      expect(
        () => reviewsService.submitReview(
          productId: testProductId,
          review: testReview,
        ),
        throwsAssertionError,
      );
    });
    test('non null user, sets review', () async {
      // setup
      when(() => authRepository.currentUser).thenReturn(testUser);
      when(() => reviewsRepository.setReview(
            productId: testProductId,
            uid: testUser.uid,
            review: testReview,
          )).thenAnswer((_) => Future.value());
      final reviewsService = makeReviewsService();
      // run
      await reviewsService.submitReview(productId: '1', review: testReview);
      // verify
      verify(() => authRepository.currentUser).called(1);
      verify(() => reviewsRepository.setReview(
            productId: testProductId,
            uid: testUser.uid,
            review: testReview,
          )).called(1);
    });
  });
}
