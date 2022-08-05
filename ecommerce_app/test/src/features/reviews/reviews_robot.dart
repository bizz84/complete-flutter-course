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

  void expectFindUpdateReview() {
    final finder = find.text('Update review');
    expect(finder, findsOneWidget);
  }

  Future<void> tapLeaveReviewButton() async {
    final finder = find.text('Leave a review');
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> tapUpdateReviewButton() async {
    final finder = find.text('Update review');
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

  void expectFindText(String text) {
    final finder = find.text(text);
    expect(finder, findsOneWidget);
  }

  // leave a review
  Future<void> enterReviewRating() async {
    final finder = find.byKey(const Key('stars-4'));
    expect(finder, findsOneWidget);
    await tester.tap(finder);
  }

  Future<void> enterReviewComment(String comment) async {
    final finder = find.byKey(LeaveReviewForm.reviewCommentKey);
    expect(finder, findsOneWidget);
    await tester.enterText(finder, comment);
  }

  Future<void> submitReview() async {
    final finder = find.text('Submit');
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> createAndSubmitReview(String comment) async {
    await enterReviewRating();
    await enterReviewComment(comment);
    await submitReview();
  }

  Future<void> updateAndSubmitReview(String comment) async {
    await enterReviewComment(comment);
    await submitReview();
  }
}
