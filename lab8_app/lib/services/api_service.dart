import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../models/photo.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Photo>> fetchPhotos(http.Client client) async {
    final response = await client.get(
      Uri.parse('$_baseUrl/photos'),
    );

    if (response.statusCode == 200) {
      return compute(parsePhotos, response.body);
    } else {
      throw Exception('Ошибка загрузки фотографий');
    }
  }

  static List<Photo> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }
}