import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:my_finances_app/core/forms/form_data.dart';

abstract class ApiRequest {
  static const String baseUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'http://localhost:8080',
  );

  static Future<http.Response> post(String path, FormData data) async {
    final response = await http.post(
      Uri.parse('${ApiRequest.baseUrl}$path'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to post data');
    }
  }
}
