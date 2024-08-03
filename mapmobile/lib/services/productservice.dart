import 'package:dio/dio.dart';
import 'package:mapmobile/services/api.dart';

Future<dynamic> getAllProduct() async {
  final dio = Dio();
  final response = await dio.get('${baseURL}Product');
  return response;
}
