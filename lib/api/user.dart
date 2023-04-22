import 'package:record_book_app/utils/request.dart';

import '../utils/token.dart';

class UserApi {
  Future<String> login(dynamic payload) async {
    try {
      Map<String, dynamic> result =
          await HttpService.post("/v1/user/login", payload);
      final String token = result["data"]["token"];
      final Map<String, dynamic> user = result["data"]["user"];

      saveToken(token);
      return result["msg"].toString();
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }

  Future<Map<String, dynamic>> getUser(dynamic payload) async {
    try {
      Map<String, dynamic> result =
          await HttpService.post("/v1/user/login", payload);
      final Map<String, dynamic> user = result["data"];
      return user;
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }
}
