import 'package:flutter/material.dart';

class NetworkImageWithFallback extends StatelessWidget {
  final String imageUrl;
  final Widget fallbackWidget;

  const NetworkImageWithFallback({
    Key? key,
    required this.imageUrl,
    required this.fallbackWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return fallbackWidget; // Display the fallback widget if an error occurs
      },
    );
  }
}
