import 'package:flutter/material.dart';
import 'package:mapmobile/pages/Book/widgets/header.dart';
import 'package:mapmobile/services/locationservice.dart';
import 'package:mapmobile/shared/networkimagefallback.dart';
import 'package:mapmobile/shared/text.dart';

class FullMap extends StatefulWidget {
  const FullMap({super.key});

  @override
  State<FullMap> createState() => _FullMapState();
}

class _FullMapState extends State<FullMap> {
  List<dynamic> locations = [];
  @override
  void initState() {
    super.initState();
    getAllLoc().then((res) {
      setState(() {
        locations = res;
      });
      print(locations);
    }).catchError((error) {
      print(error);
    });
  }

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
            Stack(
              children: [
                Image.asset(
                  "assets/images/map.png",
                  fit: BoxFit.contain,
                ),
                ...locations.map((loc) {
                  if (loc['xLocation'] != null && loc['yLocation'] != null) {
                    return Positioned(
                      left: loc['xLocation'] * parentwidth + parentwidth / 30,
                      top: loc['yLocation'] * parentheight / 2,
                      child: Row(
                        children: [
                          Container(
                            width: parentwidth / 17,
                            height: parentheight / 10,
                            color: Colors.red,
                            // child: NetworkImageWithFallback(
                            //     imageUrl: loc['urlImage'] ?? "",
                            //     fallbackWidget: const Icon(Icons.error)),
                          ),
                          Positioned(
                              left: loc['xLocation'] * parentwidth,
                              top: loc['yLocation'] * parentheight / 4,
                              child: Visibility(
                                visible: true,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.red,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color.fromARGB(
                                                255, 226, 245, 255)),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: NetworkImageWithFallback(
                                                  imageUrl:
                                                      loc['urlImage'] ?? "",
                                                  fallbackWidget:
                                                      const Icon(Icons.error)),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  DynamicText(
                                                    text: loc['locationName'] ??
                                                        "",
                                                    textStyle: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ]),
                              ))
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
