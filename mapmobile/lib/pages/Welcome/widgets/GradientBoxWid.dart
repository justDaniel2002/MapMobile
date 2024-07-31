import 'package:flutter/material.dart';
import 'package:mapmobile/shared/box.dart';
import 'package:mapmobile/shared/text.dart';

class GradientWid extends StatelessWidget {
  const GradientWid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: GBoxWid("Thông tin sách", Icons.book),
        ),
        Flexible(
          flex: 1,
          child: GBoxWid("Thông tin nhà xuất bản", Icons.people),
        ),
        Flexible(
          flex: 1,
          child: GBoxWid("Thông tin đồ lưu niệm", Icons.book),
        ),
      ],
    );
  }
}

class GBoxWid extends StatelessWidget {
  const GBoxWid(this.text, this.icon,
      {super.key,
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
  final IconData icon;
  final String text;
  final LinearGradient gradient;
  @override
  Widget build(BuildContext context) {
    return GradientBox(
        gradient: gradient,
        widget: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 20),
              child: Icon(
                icon,
                size: 30,
              ),
            ),
            DynamicText(
              text: text,
              textStyle: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ));
  }
}
