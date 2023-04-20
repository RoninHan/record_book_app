import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Save token to local storage
Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
}

// Load token from local storage
Future<String?> loadToken() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');

  // 如果 token 存在，则返回 token；否则返回 null
  if (token != null && token.isNotEmpty) {
    debugPrint("token");
    return token;
  } else {
    debugPrint("null");
    return null;
  }
}

// Remove token from local storage
Future<void> removeToken() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
}
