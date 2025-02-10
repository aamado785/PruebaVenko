import 'dart:convert';
import 'package:flutter/services.dart';

class ApiConfig {
  static Map<String, dynamic>? _data;

  static Future<void> loadConfig() async {
    final String response = await rootBundle.loadString('assets/venko_clinica.postman_collection.json');
    _data = json.decode(response);
  }

  static String? getBaseUrl() {
    return _data?["item"][0]["request"]["url"]["raw"];
  }
}
