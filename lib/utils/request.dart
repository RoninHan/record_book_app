import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpService {
  static final Dio _dio = Dio();

  static final String apiUrl = dotenv.env['BASE_URL'] ?? "";

  static Future<dynamic> get(String path) async {
    try {
      final requestApi = apiUrl + path;
      final Response response = await _dio.get(requestApi);
      return jsonDecode(response.toString());
    } on DioError catch (e) {
      throw e.message;
    }
  }

  static Future<dynamic> post(String path, dynamic data) async {
    try {
      final requestApi = apiUrl + path;
      final Response response = await _dio.post(requestApi, data: data);
      return jsonDecode(response.toString());
    } on DioError catch (e) {
      throw e.message;
    }
  }

  // Add more methods for HTTP requests as needed.
}
