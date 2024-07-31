import 'package:flutter/material.dart';
import 'package:mapmobile/shared/currentTime.dart';
import 'package:mapmobile/shared/switch.dart';
import 'package:mapmobile/shared/text.dart';
import 'package:mapmobile/util/util.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientText(
                "BOOKSTREET",
                style: TextStyle(fontSize: 25),
              ),
              ThinSmText(
                text: "mỗi trải nhiệm, một niềm vui",
                color: Colors.black38,
              )
            ],
          ),
          Row(
            children: [
              const Currenttime(),
              BoldLGText(
                text: getCurrentDate(),
                color: Colors.black54,
              )
            ],
          ),
          const SwitchExample(),
        ],
      ),
    );
  }
}
