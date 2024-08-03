import 'package:flutter/material.dart';
import 'package:mapmobile/pages/Book/widgets/booklist.dart';
import 'package:mapmobile/pages/Book/widgets/categorysidebar.dart';
import 'package:mapmobile/pages/Book/widgets/genresidebar.dart';
import 'package:mapmobile/pages/Book/widgets/header.dart';
import 'package:mapmobile/services/genreservice.dart';
import 'package:mapmobile/services/productservice.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  List<dynamic> books = [];
  List<dynamic> genres = [];
  int cid = 0;
  int gid = 0;
  Future<void> onCateChange(int categoryId) async {
    cid = categoryId;
    getGenreByCate(categoryId).then((res) {
      setState(() {
        genres = res.data['data']['list'];
      });
    });

    getBook(categoryId: categoryId).then((res) {
      setState(() {
        books = res.data['data']['list'];
      });
    });
  }

  Future<void> onGenreChange(int genreId) async {
    gid = genreId;
    getBook(categoryId: cid, genreId: genreId).then((res) {
      setState(() {
        books = res.data['data']['list'];
      });
    });
  }

  Future<void> onTextChange(String text) async {
    print("text change api... $text");
    getBook(categoryId: cid, genreId: gid, search: text).then((res) {
      print("get book ${res.data['data']['list']}");
      setState(() {
        books = res.data['data']['list'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getBook().then((res) {
      setState(() {
        books = res.data['data']['list'];
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
                child: Header(
                  onTextChange: onTextChange,
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: 3,
                    child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(right: 10),
                        child: BookList(books: books))),
                Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GenreSidebar(
                          genres: genres,
                          onGenreChange: onGenreChange,
                        ),
                        CategorySidebar(
                          onCateChange: onCateChange,
                        )
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
