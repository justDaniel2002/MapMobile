import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mapmobile/pages/Book/widgets/header.dart';
import 'package:mapmobile/services/locationservice.dart';
import 'package:mapmobile/services/storeservice.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key, this.storeId});
  final String? storeId;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  dynamic store = {};
  dynamic location = {};
  @override
  void initState() {
    super.initState();
    getStoreById(widget.storeId).then((res) {
      // getLocById(res['locationId']).then((locres) {
      //   setState(() {
      //     location = locres;
      //     store = res;
      //   });
      // });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    double parentwidth = MediaQuery.of(context).size.width;
    double parentheight = MediaQuery.of(context).size.height;
    double left = location['xLocation'] ?? 0 * parentwidth;
    double top = location['yLocation'] ?? 0 * parentheight / 2;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Header(onTextChange: () {}),
            ),
            Stack(
              children: [
                Image.asset(
                  "assets/images/map.png",
                  fit: BoxFit.contain,
                ),
                Positioned(left: left, top: top, child: Icon(Icons.donut_large))
              ],
            )
          ],
        ),
      ),
    );
  }
}
