import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mapmobile/services/customerservice.dart';
import 'package:mapmobile/shared/text.dart';
import 'package:mapmobile/util/util.dart';
import 'package:mapmobile/pages/Book/widgets/header.dart';

class PointHistory extends StatefulWidget {
  const PointHistory({super.key, this.phone});
  final String? phone;
  @override
  State<PointHistory> createState() => _PointHistoryState();
}

class _PointHistoryState extends State<PointHistory> {
  List<dynamic> histories = [];

  @override
  void initState() {
    super.initState();
    getPointHistory2(widget.phone).then((res) {
      setState(() {
        histories = res['data']['list'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double parentwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: Header(
                onTextChange: () {},
              ),
            ),
            const DynamicText(
                text: "Lịch sử tích điểm",
                textStyle: TextStyle(
                    color: Color.fromARGB(255, 182, 12, 0),
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            Container(
              width: parentwidth / 5 * 3,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DynamicText(
                    text: "Lịch sử tích điểm",
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  ...histories.map((h) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DynamicText(
                              text: h['note'],
                              textStyle: TextStyle(color: Colors.green),
                            ),
                            DynamicText(text: formatDateTime(h['createdAt']))
                          ])),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          backgroundColor:
                              const Color.fromARGB(255, 206, 14, 0)),
                      child: const DynamicText(
                        text: "Quay lại",
                        textStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
