import 'package:dio/dio.dart';
import 'package:mapmobile/services/api.dart';

Future<dynamic> getAllCate() async {
  final dio = Dio();
  final response = await dio.get('${baseURL}Category');
  return response;
}
