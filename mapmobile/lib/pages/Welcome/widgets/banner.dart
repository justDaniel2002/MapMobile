import 'package:flutter/material.dart';
import 'package:mapmobile/pages/Welcome/widgets/GradientBoxWid.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/mallbanner.jpg', fit: BoxFit.contain),
        const GradientWid()
      ],
    );
  }
}
