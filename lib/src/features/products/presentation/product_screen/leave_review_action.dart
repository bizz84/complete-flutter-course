import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:ecommerce_app/src/features/reviews/application/reviews_service.dart';
import 'package:ecommerce_app/src/features/reviews/application/user_purchase_provider.dart';
import 'package:ecommerce_app/src/localization/string_hardcoded.dart';
import 'package:ecommerce_app/src/routing/app_router.dart';
import 'package:ecommerce_app/src/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/common_widgets/custom_text_button.dart';
import 'package:ecommerce_app/src/common_widgets/responsive_two_column_layout.dart';
import 'package:ecommerce_app/src/constants/app_sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Simple widget to show the product purchase date along with a button to
/// leave a review.
class LeaveReviewAction extends ConsumerWidget {
  const LeaveReviewAction({super.key, required this.productId});
  final ProductID productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchase = ref.watch(userPurchaseProvider(productId)).value;
    if (purchase != null) {
      final dateFormatted =
          ref.watch(dateFormatterProvider).format(purchase.orderDate);
      return Column(
        children: [
          const Divider(),
          gapH8,
          ResponsiveTwoColumnLayout(
            spacing: Sizes.p16,
            breakpoint: 300,
            startFlex: 3,
            endFlex: 2,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            rowCrossAxisAlignment: CrossAxisAlignment.center,
            columnCrossAxisAlignment: CrossAxisAlignment.center,
            startContent: Text('Purchased on $dateFormatted'.hardcoded),
            endContent: Consumer(
              builder: (context, ref, child) {
                final review =
                    ref.watch(userReviewStreamProvider(productId)).value;
                return CustomTextButton(
                  text: (review != null ? 'Update review' : 'Leave a review')
                      .hardcoded,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.green[700]),
                  onPressed: () => context.goNamed(
                    AppRoute.leaveReview.name,
                    params: {'id': productId},
                  ),
                );
              },
            ),
          ),
          gapH8,
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
