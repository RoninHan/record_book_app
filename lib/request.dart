import 'dart:convert';

import 'package:dio/dio.dart';

class HttpService {
  static final Dio _dio = Dio();

  static Future<dynamic> get(String path) async {
    try {
      final Response response = await _dio.get(path);
      return jsonDecode(response.toString());
    } on DioError catch (e) {
      throw e.message;
    }
  }

  static Future<dynamic> post(String path, dynamic data) async {
    try {
      final Response response = await _dio.post(path, data: data);
      return jsonDecode(response.toString());
    } on DioError catch (e) {
      throw e.message;
    }
  }

  // Add more methods for HTTP requests as needed.
}
