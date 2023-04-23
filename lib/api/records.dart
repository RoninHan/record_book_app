import 'package:record_book_app/utils/request.dart';

import '../utils/token.dart';

class RecordApi {
  Future<List<Map<String, dynamic>>> getRecord() async {
    try {
      final result = await HttpService.post("/v1/record/list", {});
      final List<Map<String, dynamic>> records = result["data"];
      final String token = result["data"]["token"];

      saveToken(token);
      return records;
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }

  Future<String> createRecord() async {
    try {
      final result = await HttpService.post("/v1/record/list", {});

      final String token = result["data"]["token"];

      saveToken(token);
      return result["msg"].toString();
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }
}
