import 'package:ecommerce_app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/common_widgets/responsive_center.dart';
import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:ecommerce_app/src/constants/app_sizes.dart';
import 'package:ecommerce_app/src/features/product_page/product_reviews/product_rating_bar.dart';
import 'package:ecommerce_app/src/models/review.dart';

class LeaveReviewScreen extends StatelessWidget {
  const LeaveReviewScreen({Key? key, required this.productId})
      : super(key: key);
  final String productId;

  @override
  Widget build(BuildContext context) {
    // TODO: Read from data source
    const review = null;
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave a review'.hardcoded),
      ),
      body: ResponsiveCenter(
        maxContentWidth: Breakpoint.tablet,
        padding: const EdgeInsets.all(Sizes.p16),
        child: LeaveReviewForm(productId: productId, review: review),
      ),
    );
  }
}

class LeaveReviewForm extends StatefulWidget {
  const LeaveReviewForm({Key? key, required this.productId, this.review})
      : super(key: key);
  final String productId;
  final Review? review;

  static const reviewCommentKey = Key('reviewComment');

  @override
  State<LeaveReviewForm> createState() => _LeaveReviewFormState();
}

class _LeaveReviewFormState extends State<LeaveReviewForm> {
  final _controller = TextEditingController();

  double _rating = 0;

  @override
  void initState() {
    super.initState();
    if (widget.review != null) {
      _controller.text = widget.review!.comment;
      _rating = widget.review!.score;
    }
  }

  Future<void> _submitReview() async {
    // only submit if new rating or different from before
    final previousReview = widget.review;
    if (previousReview == null ||
        _rating != previousReview.score ||
        _controller.text != previousReview.comment) {
      // TODO: Submit review
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Not implemented')),
      );
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.review != null) ...[
          Text(
            'You reviewed this product before. You can edit your review.'
                .hardcoded,
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
          // TODO: Loading state
          isLoading: false,
          onPressed: _rating == 0 ? null : _submitReview,
        )
      ],
    );
  }
}
