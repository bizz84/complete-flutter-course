import 'package:ecommerce_app/src/features/reviews/presentation/leave_review_screen/leave_review_screen.dart';
import 'package:ecommerce_app/src/features/reviews/presentation/product_reviews/product_review_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class ReviewsRobot {
  ReviewsRobot(this.tester);
  final WidgetTester tester;

  void expectFindLeaveReview() {
    final finder = find.text('Leave a review');
    expect(finder, findsOneWidget);
  }

  Future<void> tapLeaveReviewButton() async {
    final finder = find.text('Leave a review');
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  void expectFindOneReview() {
    // don't skip offstage widgets as the product reviews may appear below
    // the visible area on screen
    final finder = find.byType(ProductReviewCard, skipOffstage: false);
    expect(finder, findsOneWidget);
  }

  // leave a review
  Future<void> selectReviewScore() async {
    final finder = find.byKey(const Key('stars-4'));
    expect(finder, findsOneWidget);
    await tester.tap(finder);
  }

  Future<void> enterReviewComment() async {
    final finder = find.byKey(LeaveReviewForm.reviewCommentKey);
    expect(finder, findsOneWidget);
    await tester.enterText(finder, 'Love it!');
  }

  Future<void> submitReview() async {
    final finder = find.text('Submit');
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> createAndSubmitReview() async {
    await selectReviewScore();
    await enterReviewComment();
    await submitReview();
  }
}
