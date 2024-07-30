import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  const GradientBox(
      {super.key,
      required this.widget,
      this.gradient = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment(0.8, 1),
        colors: <Color>[
          Color(0xff1f005c),
          Color(0xff5b0060),
          Color(0xff870160),
          Color(0xffac255e),
          Color(0xffca485c),
          Color(0xffe16b5c),
          Color(0xfff39060),
          Color(0xffffb56b),
        ], // Gradient from https://learnui.design/tools/gradient-generator.html
        tileMode: TileMode.mirror,
      )});

  final Widget widget;
  final LinearGradient gradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: gradient),
      child: widget,
    );
  }
}
