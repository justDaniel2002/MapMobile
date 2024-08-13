import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mapmobile/pages/Book/widgets/header.dart';
import 'package:mapmobile/services/locationservice.dart';
import 'package:mapmobile/services/storeservice.dart';
import 'package:mapmobile/shared/networkimagefallback.dart';
import 'package:mapmobile/shared/text.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key, this.storeId});
  final String? storeId;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  dynamic store = {};
  dynamic location = {"xLocation": 0, "yLocation": 0};
  @override
  void initState() {
    super.initState();
    getStoreById(widget.storeId).then((res) {
      getLocById(res['locationId']).then((locres) {
        print("location");
        print(locres);
        setState(() {
          location = locres;
          store = res;
        });
        print(location);
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    double parentwidth = MediaQuery.of(context).size.width;
    double parentheight = MediaQuery.of(context).size.height;
    double left = location['xLocation'] * parentwidth;
    double top = location['yLocation'] * parentheight / 4;
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
                Positioned(
                    left: left,
                    top: top,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    const Color.fromARGB(255, 226, 245, 255)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: NetworkImageWithFallback(
                                      imageUrl: store['urlImage'] ?? "",
                                      fallbackWidget: const Icon(Icons.error)),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      DynamicText(
                                        text: store['storeName'] ?? "",
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.blue,
                                          ),
                                          DynamicText(
                                              text:
                                                  "${location['locationName'] ?? ""} (location)")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.schedule,
                                            color: Colors.green,
                                          ),
                                          DynamicText(
                                              text:
                                                  "${store['openingHours'] ?? ""} - ${store['closingHours'] ?? ""} (open/closing time)")
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ]))
              ],
            )
          ],
        ),
      ),
    );
  }
}
