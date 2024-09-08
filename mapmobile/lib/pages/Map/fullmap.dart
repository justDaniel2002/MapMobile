import 'package:flutter/material.dart';
import 'package:mapmobile/models/map_model.dart';
import 'package:mapmobile/pages/Book/widgets/header.dart';
import 'package:mapmobile/services/locationservice.dart';
import 'package:mapmobile/shared/networkimagefallback.dart';
import 'package:mapmobile/shared/text.dart';
import 'package:provider/provider.dart';

class FullMap extends StatefulWidget {
  const FullMap({super.key});

  @override
  State<FullMap> createState() => _FullMapState();
}

class _FullMapState extends State<FullMap> {
  dynamic hoverStore = null;

  @override
  Widget build(BuildContext context) {
    double parentwidth = MediaQuery.of(context).size.width;
    double parentheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: Header(onTextChange: () {}),
            ),
            Consumer<MapModel>(builder: (context, value, child) {
              final model = context.read<MapModel>();
              return Stack(
                children: [
                  Image.asset(
                    "assets/images/map.png",
                    fit: BoxFit.contain,
                  ),
                  ...model.locations.map((loc) {
                    if (loc['xLocation'] != null && loc['yLocation'] != null) {
                      return Positioned(
                        left: loc['xLocation'] * parentwidth + parentwidth / 30,
                        top: loc['yLocation'] * parentheight / 2.1,
                        child: Row(
                          children: [
                            MouseRegion(
                              onEnter: (event) {
                                setState(() {
                                  hoverStore = loc['storeId'];
                                });
                              },
                              onExit: (event) {
                                setState(() {
                                  hoverStore = null;
                                });
                              },
                              child: Container(
                                width: parentwidth / 17,
                                height: parentheight / 10,
                                child: NetworkImageWithFallback(
                                    imageUrl: loc['storeImage'] ?? "",
                                    fallbackWidget: const Icon(Icons.error)),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
