import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

/// Custom product rating widget
class ProductRatingBar extends StatelessWidget {
  const ProductRatingBar({
    super.key,
    this.initialRating = 0.0,
    this.itemSize = 40,
    this.ignoreGestures = false,
    required this.onRatingUpdate,
  });

  /// initial rating value
  final double initialRating;

  /// size of each of the 5 star icons
  final double itemSize;

  /// if true, the widget won't be interactive
  final bool ignoreGestures;

  /// callback called when the rating changes
  final ValueChanged<double> onRatingUpdate;

  // * Keys for testing using find.byKey()
  static Key starRatingKey(int index) => Key('stars-$index');

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      ignoreGestures: ignoreGestures,
      glow: false,
      allowHalfRating: true,
      itemSize: itemSize,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        // * Keys for testing using find.byKey()
        key: starRatingKey(index),
        color: Colors.amber,
      ),
      onRatingUpdate: onRatingUpdate,
    );
  }
}
