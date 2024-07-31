import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  const GradientBox({super.key, required this.widget, required this.gradient});

  final Widget widget;
  final LinearGradient gradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: gradient, borderRadius: BorderRadius.circular(10)),
      child: widget,
    );
  }
}
