import 'package:record_book_app/utils/request.dart';

import '../utils/token.dart';

class CategoriesApi {
  Future<List<dynamic>> getCategories(Map<String, dynamic> paylaod) async {
    try {
      final result = await HttpService.post("/v1/categories/list", paylaod);
      final Map<String, dynamic> data = result["data"];
      final List<dynamic> records = data["data"];
      final String token = data["token"];

      saveToken(token);
      return records;
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }

  Future<String> createCategories() async {
    try {
      final result = await HttpService.post("/v1/categories/create", {});

      final String token = result["data"]["token"];

      saveToken(token);
      return result["msg"].toString();
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }
}
