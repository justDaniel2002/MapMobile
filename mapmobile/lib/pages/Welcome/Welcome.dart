import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mapmobile/pages/Welcome/widgets/banner.dart';
import 'package:mapmobile/pages/Welcome/widgets/header.dart';
import 'package:mapmobile/shared/text.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Header(),
                Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.only(right: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const BoldXLText(
                                  text:
                                      "Đường Sách Nguyễn Văn Bình XIN CHÀO BẠN!"),
                              const DynamicText(
                                text:
                                    "Hãy cùng nhau tận hưởng, trải nhiệm những hoạt động tiện ích thú vị, đa dạng phong phú tại đường sách nhé.",
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w100),
                                verMargin: 30,
                              ),
                              Image.asset('assets/images/bookbanner.jpg',
                                  width: double.infinity, fit: BoxFit.contain)
                            ],
                          ),
                        ),
                      ),
                      const Flexible(flex: 7, child: MyBanner())
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
