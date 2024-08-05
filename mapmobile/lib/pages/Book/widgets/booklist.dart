import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mapmobile/shared/text.dart';
import 'package:mapmobile/util/util.dart';

class BookList extends StatelessWidget {
  const BookList({super.key, required this.books});
  final List<dynamic> books;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double parentWidth = constraints.maxWidth;
      double deviceHeight = MediaQuery.of(context).size.height;
      double itemWidth = parentWidth / 6.2;
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        height: deviceHeight - deviceHeight / 4,
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 14.0,
            runSpacing: 8.0,
            children: [
              ...books.map((b) {
                final imageURL = b["urlImage"] != null &&
                        isImageUrl(b["urlImage"])
                    ? b["urlImage"]
                    : "https://fptbs.azurewebsites.net/api/File/image/e8318d16-7bd9-43d9-bdd3-36feeb30bd7b.png?resizeIfWider=true&resizeImageAndRatio=true";

                return InkWell(
                  onTap: () {
                    context.push("/product/${b["productId"]}");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 211, 211, 211))),
                    child: Column(
                      children: [
                        Image.network(imageURL,
                            fit: BoxFit.contain, width: itemWidth,
                            errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: itemWidth,
                            child: Icon(Icons.error),
                          ); // Display the fallback widget if an error occurs
                        }),
                        SizedBox(
                          width: itemWidth,
                          child: Text(
                            b["productName"],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                        ),
                        SizedBox(
                            width: itemWidth,
                            child: DynamicText(text: formatToVND(b["price"])))
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      );
    });
  }
}
