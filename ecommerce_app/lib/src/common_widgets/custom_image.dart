import 'package:flutter/material.dart';

/// Custom image widget that loads an image as a static asset.
class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    // TODO: Use [CachedNetworkImage] if the url points to a remote resource
    return Image.asset(imageUrl);
  }
}
