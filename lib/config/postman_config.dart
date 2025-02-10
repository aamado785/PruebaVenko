import 'dart:convert';
import 'package:flutter/services.dart';

class PostmanConfig {
  static Map<String, dynamic>? _data;

  static Future<void> loadConfig() async {
    final String response = await rootBundle.loadString('assets/venko clinica.postman_collection.json');
    _data = json.decode(response);
  }

  static String? getUrl(String endpoint) {
    if (_data == null) return null;
    for (var item in _data!['item']) {
      if (item['name'].toLowerCase() == endpoint.toLowerCase()) {
        return item['request']['url']['raw'];
      }
    }
    return null;
  }
}