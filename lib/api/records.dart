import 'package:record_book_app/utils/request.dart';

import '../utils/token.dart';

class RecordApi {
  Future<List<dynamic>> getTodayRecords() async {
    try {
      final result = await HttpService.post("/v1/record/list-today", {});
      final Map<String, dynamic> data = result["data"];
      final List<dynamic> records = data["data"];
      final String token = data["token"];

      saveToken(token);
      return records;
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }

  Future<String> createRecord(Map<String, dynamic> payload) async {
    try {
      final result = await HttpService.post("/v1/record/create", payload);

      final String token = result["data"]["token"];

      saveToken(token);
      return result["msg"].toString();
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }
}
