import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:softwars_todo/logic/services/network_service.dart';

class ApiService {
  final String _baseUrl = dotenv.env['API_URL'].toString();
  final NetworkService _networkService = NetworkService();

  Future<Map<String, dynamic>> get(String endpoint) async {
    final url = Uri.parse('$_baseUrl$endpoint');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      _networkService.addToRetryQueue(() => get(endpoint));
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(
    String endpoint,
    List<Map<String, dynamic>> body,
  ) async {
    final url = Uri.parse('$_baseUrl$endpoint');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      _networkService.addToRetryQueue(() => post(endpoint, body));
      rethrow;
    }
  }

  Future<Map<String, dynamic>> put(
    String endpoint,
    Map<String, int> body,
  ) async {
    final url = Uri.parse('$_baseUrl$endpoint');

    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      _networkService.addToRetryQueue(() => put(endpoint, body));
      rethrow;
    }
  }

  Future<Map<String, dynamic>> delete(String endpoint) async {
    final url = Uri.parse('$_baseUrl$endpoint');

    try {
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      _networkService.addToRetryQueue(() => delete(endpoint));
      rethrow;
    }
  }
}
