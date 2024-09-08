import 'package:flutter/material.dart';
import 'package:mapmobile/pages/Book/widgets/header.dart';
import 'package:mapmobile/routers/route.dart';
import 'package:mapmobile/shared/text.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 40),
            child: Header(
              onTextChange: () {},
            ),
          ),
          DynamicText(text: "Thông tin điểm")
        ],
      ),
    );
  }
}
