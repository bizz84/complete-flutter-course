import 'package:ecommerce_app/src/common_widgets/async_value_widget.dart';
import 'package:ecommerce_app/src/constants/breakpoints.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:ecommerce_app/src/features/reviews/application/reviews_service.dart';
import 'package:ecommerce_app/src/features/reviews/presentation/leave_review_screen/leave_review_controller.dart';
import 'package:ecommerce_app/src/features/reviews/presentation/product_reviews/product_rating_bar.dart';
import 'package:ecommerce_app/src/localization/string_hardcoded.dart';
import 'package:ecommerce_app/src/utils/async_value_ui.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/common_widgets/responsive_center.dart';
import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:ecommerce_app/src/constants/app_sizes.dart';
import 'package:ecommerce_app/src/features/reviews/domain/review.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LeaveReviewScreen extends StatelessWidget {
  const LeaveReviewScreen({super.key, required this.productId});
  final ProductID productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave a review'.hardcoded),
      ),
      body: ResponsiveCenter(
        maxContentWidth: Breakpoint.tablet,
        padding: const EdgeInsets.all(Sizes.p16),
        child: Consumer(
          builder: (context, ref, child) {
            final reviewValue = ref.watch(userReviewFutureProvider(productId));
            return AsyncValueWidget<Review?>(
              value: reviewValue,
              data: (review) =>
                  LeaveReviewForm(productId: productId, review: review),
            );
          },
        ),
      ),
    );
  }
}

class LeaveReviewForm extends ConsumerStatefulWidget {
  const LeaveReviewForm({super.key, required this.productId, this.review});
  final ProductID productId;
  final Review? review;

  // * Keys for testing using find.byKey()
  static const reviewCommentKey = Key('reviewComment');

  @override
  ConsumerState<LeaveReviewForm> createState() => _LeaveReviewFormState();
}

class _LeaveReviewFormState extends ConsumerState<LeaveReviewForm> {
  final _controller = TextEditingController();

  double _rating = 0;

  @override
  void initState() {
    super.initState();
    final review = widget.review;
    if (review != null) {
      _controller.text = review.comment;
      _rating = review.rating;
    }
  }

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      leaveReviewControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(leaveReviewControllerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.review != null) ...[
          Text(
            'You reviewed this product before. Submit again to edit.'.hardcoded,
            textAlign: TextAlign.center,
          ),
          gapH24,
        ],
        Center(
          child: ProductRatingBar(
            initialRating: _rating,
            onRatingUpdate: (rating) => setState(() => _rating = rating),
          ),
        ),
        gapH32,
        TextField(
          key: LeaveReviewForm.reviewCommentKey,
          controller: _controller,
          textCapitalization: TextCapitalization.sentences,
          maxLines: 5,
          decoration: InputDecoration(
            labelText: 'Your review (optional)'.hardcoded,
            border: const OutlineInputBorder(),
          ),
        ),
        gapH32,
        PrimaryButton(
          text: 'Submit'.hardcoded,
          isLoading: state.isLoading,
          onPressed: state.isLoading || _rating == 0
              ? null
              : () =>
                  ref.read(leaveReviewControllerProvider.notifier).submitReview(
                        previousReview: widget.review,
                        productId: widget.productId,
                        rating: _rating,
                        comment: _controller.text,
                        onSuccess: context.pop,
                      ),
        )
      ],
    );
  }
}
