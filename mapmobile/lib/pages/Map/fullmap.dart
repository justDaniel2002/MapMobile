import 'package:flutter/material.dart';
import 'package:mapmobile/models/kios_model.dart';
import 'package:mapmobile/models/map_model.dart';
import 'package:mapmobile/pages/Book/widgets/header.dart';
import 'package:mapmobile/services/locationservice.dart';
import 'package:mapmobile/services/storeservice.dart';
import 'package:mapmobile/shared/networkimagefallback.dart';
import 'package:mapmobile/shared/text.dart';
import 'package:provider/provider.dart';

class FullMap extends StatefulWidget {
  const FullMap({super.key});

  @override
  State<FullMap> createState() => _FullMapState();
}

class _FullMapState extends State<FullMap> {
  dynamic selectedStore = null;

  dynamic getStoreOnTap(String storeId) {
    getStoreById(storeId).then((res) {
      setState(() {
        selectedStore = res;
      });
      showStore();
    });
  }

  dynamic showStore() {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                Image.asset("assets/images/bookDialogBanner.jpeg"),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Positioned(
                              child: NetworkImageWithFallback(
                                  imageUrl: selectedStore['urlImage'],
                                  fallbackWidget: const Icon(Icons.error))),
                          DynamicText(
                            text: selectedStore['storeName'],
                            textStyle: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.timer),
                          DynamicText(
                              text:
                                  "${selectedStore['openingHours'] ?? ""} - ${selectedStore['closingHours'] ?? ""}",
                              textStyle: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      DynamicText(text: selectedStore['description'])
                    ],
                  ),
                )
              ],
            ));
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
            Consumer<MapModel>(builder: (context, value, child) {
              final model = context.read<MapModel>();
              return Stack(
                children: [
                  Consumer<MapModel>(builder: (context, value, child) {
                    final model = context.read<MapModel>();
                    return NetworkImageWithFallback(
                        imageUrl: model.imageUrl,
                        fallbackWidget: const Icon(Icons.error));
                  }),
                  ...model.locations.map((loc) {
                    if (loc['xLocation'] != null && loc['yLocation'] != null) {
                      return Positioned(
                        left: loc['xLocation'] * parentwidth - parentwidth / 36,
                        top: loc['yLocation'] * parentheight / 2.1,
                        child: InkWell(
                          onTap: () => getStoreOnTap(loc['storeId'].toString()),
                          child: Container(
                            width: parentwidth / 17,
                            height: parentheight / 10,
                            child: NetworkImageWithFallback(
                                imageUrl: loc['storeImage'] ?? "",
                                fallbackWidget: const Icon(Icons.error)),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
                  Consumer<KiosModel>(builder: (context, value, child) {
                    final kmodel = context.read<KiosModel>();

                    return Positioned(
                        left: kmodel.xLocation * parentwidth - parentwidth / 36,
                        top: kmodel.yLocation * parentheight / 2.1,
                        child: const Column(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            DynamicText(
                              text: "you are here",
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )
                          ],
                        ));
                  })
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
