import 'dart:convert';

import 'package:flutter_tech_task/utils/app_exceptions.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final http.Client _client;
  final String _baseUrl = "https://jsonplaceholder.typicode.com";

  Map<String, String> get _headers => {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      };

  ApiService({http.Client? client}) : _client = client ?? http.Client();

  Future<Result<dynamic>> get({required String path}) async {
    try {
      var url = Uri.parse(_baseUrl + path);
      var response = await _client.get(url, headers: _headers);
      if (response.statusCode != 200) {
        return Result.failure(error: NetworkException());
      }
      final json = jsonDecode(response.body);
      return Result.success(data: json);
    } catch (e) {
      return Result.failure(error: NetworkException(message: e.toString()));
    }
  }
}
