import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class NetworkHelper {
  static Future<dynamic> get(
      {required String url,
      Map<String, String>? headers}) async {
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      log('GET Request URL: $url');
      log('Response Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error in GET request: $e');
      rethrow;
    }
  }
}
