import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_finances_app/core/forms/form_data.dart';
import 'package:my_finances_app/requests/api_error.dart';

abstract class ApiRequest {
  static const String baseUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'http://localhost:8080',
  );

  static Future<Map<String, dynamic>> post(String path, FormData data) async {
    final response = await http.post(
      Uri.parse('${ApiRequest.baseUrl}$path'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      throw RequestError.fromJson(json);
    }
  }
}
