import 'package:dio/dio.dart';
import 'package:mapmobile/services/api.dart';

Future<dynamic> getAllGenre() async {
  final dio = Dio();
  final response = await dio.get('${baseURL}Genre');
  return response;
}
