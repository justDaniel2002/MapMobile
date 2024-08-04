import 'package:flutter/material.dart';
import 'package:mapmobile/pages/Event/widget/Eventwidget.dart';

class Eventlist extends StatelessWidget {
  const Eventlist({super.key, required this.eventList});
  final List<dynamic> eventList;

  @override
  Widget build(BuildContext context) {
    final itemwidth = MediaQuery.of(context).size.width / 4 - 40;
    final deviceHeight = MediaQuery.of(context).size.height - 40;
    return SizedBox(
      height: deviceHeight - 100,
      child: SingleChildScrollView(
        child: Container(
          child: Wrap(
            spacing: 40,
            runSpacing: 10,
            children: eventList.map((e) {
              return SizedBox(width: itemwidth, child: Eventwidget(event: e));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
