import 'package:dio/dio.dart';
import 'package:mapmobile/services/api.dart';

Future<dynamic> getEvent({String? search}) async {
  var filterData = [];

  if (search != null && search.trim() != "") {
    filterData = [
      ...filterData,
      {"field": "title", "value": search, "operand": 1}
    ];
  }
  final dio = Dio();
  final response = await dio.post('${baseURL}Event/paginate',
      data: {"limit": -1, "filters": filterData});
  return response;
}
