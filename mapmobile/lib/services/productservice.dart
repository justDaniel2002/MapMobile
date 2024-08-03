import 'package:dio/dio.dart';
import 'package:mapmobile/services/api.dart';

Future<dynamic> getAllProduct() async {
  final dio = Dio();
  final response = await dio.get('${baseURL}Product');
  return response;
}

Future<dynamic> getBook({int? categoryId, int? genreId, String? search}) async {
  var filterData = [
    {"field": "ProductTypeId", "value": "1", "operand": 0}
  ];
  if (categoryId != null && categoryId != 0) {
    filterData = [
      ...filterData,
      {"field": "CategoryId", "value": "$categoryId", "operand": 0}
    ];
  }

  if (genreId != null && genreId != 0) {
    filterData = [
      ...filterData,
      {"field": "Book.GenreId", "value": "$genreId", "operand": 0}
    ];
  }

  if (search != null && search.trim() != "") {
    filterData = [
      ...filterData,
      {"field": "productName", "value": search, "operand": 1}
    ];
  }
  final dio = Dio();
  final response = await dio.post('${baseURL}Product/paginate',
      data: {"limit": -1, "filters": filterData});
  return response;
}

Future<dynamic> getSouvenir(
    {int? categoryId, int? genreId, String? search}) async {
  var filterData = [
    {"field": "ProductTypeId", "value": "2", "operand": 0}
  ];
  if (categoryId != null && categoryId != 0) {
    filterData = [
      ...filterData,
      {"field": "CategoryId", "value": "$categoryId", "operand": 0}
    ];
  }

  if (genreId != null && genreId != 0) {
    filterData = [
      ...filterData,
      {"field": "Book.GenreId", "value": "$genreId", "operand": 0}
    ];
  }

  if (search != null && search.trim() != "") {
    filterData = [
      ...filterData,
      {"field": "productName", "value": search, "operand": 1}
    ];
  }
  final dio = Dio();
  final response = await dio.post('${baseURL}Product/paginate',
      data: {"limit": -1, "filters": filterData});
  return response;
}
