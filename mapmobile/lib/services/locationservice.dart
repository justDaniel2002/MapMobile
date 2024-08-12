import 'package:dio/dio.dart';
import 'package:mapmobile/services/api.dart';

Future<dynamic> getLocById(String? id) async {
  final dio = Dio();
  final response = await dio.get('${baseURL}Location/$id');
  return response.data;
}
