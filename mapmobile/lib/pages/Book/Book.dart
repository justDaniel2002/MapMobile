import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mapmobile/pages/Book/widgets/booklist.dart';
import 'package:mapmobile/pages/Book/widgets/categorysidebar.dart';
import 'package:mapmobile/pages/Book/widgets/genresidebar.dart';
import 'package:mapmobile/pages/Book/widgets/header.dart';
import 'package:mapmobile/services/productservice.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  List<dynamic> books = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProduct().then((res) {
      setState(() {
        books = res.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: const Header()),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: 3,
                    child: Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: BookList(books: books))),
                const Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [GenreSidebar(), CategorySidebar()],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
