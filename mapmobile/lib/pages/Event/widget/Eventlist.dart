import 'package:flutter/material.dart';
import 'package:mapmobile/models/map_model.dart';
import 'package:mapmobile/pages/Event/widget/Eventwidget.dart';
import 'package:provider/provider.dart';

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
          child: Consumer<MapModel>(
            builder: (context, value, child) {
              final model = context.read<MapModel>();
              return Wrap(
                spacing: 40,
                runSpacing: 10,
                children: [
                  ...model?.locations?.map((loc) {
                    if (loc['events']?.length > 0) {
                      return SizedBox(
                          width: itemwidth,
                          child: Eventwidget(event: loc['events'][0]));
                    } else
                      return Container();
                  })
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
