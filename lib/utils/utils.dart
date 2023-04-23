import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class Utils {
  ///使用md5加密
  static String generateMD5(String data) {
    Uint8List content = new Utf8Encoder().convert(data);
    Digest digest = md5.convert(content);
    return digest.toString();
  }

  static Color getColorFromString(String str) {
    String cleanStr = str.replaceAll('#', '');
    int colorInt = int.parse(cleanStr, radix: 16);
    return Color(colorInt).withOpacity(1.0);
  }
}
