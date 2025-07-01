import 'package:dio/dio.dart';

class ApiServices {
  //volumes
  final _baseUrl = 'https://www.googleapis.com/books/v1/';

  final Dio _dio;

  ApiServices(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var res = await _dio.get('$_baseUrl$endPoint');

    return res.data;
  }
}
