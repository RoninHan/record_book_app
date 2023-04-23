import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:record_book_app/utils/token.dart';

class HttpService {
  static final String apiUrl = dotenv.env['BASE_URL'] ?? "";

  static final Map<String, dynamic> _headers = {
    "Authorization": "Banner ${loadToken()}"
  };

  static final Options options = Options(headers: _headers);

  static final Dio _dio = Dio();

  static Future<dynamic> get(String path) async {
    try {
      final requestApi = apiUrl + path;
      final Response response = await _dio.get(requestApi, options: options);
      return jsonDecode(response.toString());
    } on DioError catch (e) {
      throw e.message;
    }
  }

  static Future<dynamic> post(String path, dynamic data) async {
    try {
      final requestApi = apiUrl + path;
      final Response response =
          await _dio.post(requestApi, data: data, options: options);
      return jsonDecode(response.toString());
    } on DioError catch (e) {
      throw e.message;
    }
  }

  // Add more methods for HTTP requests as needed.
}
