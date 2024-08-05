import 'package:flutter/material.dart';
import 'package:mapmobile/pages/Book/widgets/header.dart';
import 'package:mapmobile/services/productservice.dart';
import 'package:mapmobile/shared/networkimagefallback.dart';
import 'package:mapmobile/shared/text.dart';
import 'package:mapmobile/util/util.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.pid});
  final dynamic pid;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  dynamic product = {};

  @override
  void initState() {
    super.initState();
    getProductById(widget.pid).then((res) {
      print("product");
      print(res);
      setState(() {
        product = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Header(
                  onTextChange: () {},
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: NetworkImageWithFallback(
                            imageUrl: product["urlImage"] ?? "",
                            fallbackWidget: const Icon(Icons.error)),
                      )),
                  Flexible(
                      flex: 3,
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const DynamicText(
                                    text: "Thông Tin Chi Tiết",
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 300,
                                    child: GridView.count(
                                      // shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 1,
                                      mainAxisSpacing: 1,
                                      childAspectRatio: 5,
                                      children: [
                                        const DynamicText(
                                            text: ("Mã sản phẩm")),
                                        DynamicText(
                                            text: product['productId'] != null
                                                ? product['productId']
                                                    .toString()
                                                : ""),
                                        const DynamicText(
                                            text: ("Tên sản phẩm")),
                                        DynamicText(
                                            text: product['productName'] ?? ""),
                                        const DynamicText(text: ("Phân loại")),
                                        DynamicText(
                                            text:
                                                product['categoryName'] ?? ""),
                                        const DynamicText(text: ("Giá")),
                                        DynamicText(
                                            text: formatToVND(
                                                product['price'] ?? 0))
                                      ],
                                    ),
                                  ),
                                  const DynamicText(
                                    text: "Mô tả sản phẩm",
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  DynamicText(
                                    text: product['description'] ?? "",
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
