import 'package:flutter/material.dart';
import 'package:mapmobile/pages/Book/widgets/header.dart';
import 'package:mapmobile/shared/text.dart';

class Inputphone extends StatelessWidget {
  const Inputphone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: Header(onTextChange: () {})),
          const DynamicText(text: "Điểm tích lũy của bạn"),
          TextField(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                backgroundColor: const Color.fromARGB(255, 206, 14, 0)),
            child: const DynamicText(text: "Tra cứu"),
          )
        ],
      )),
    );
  }
}
