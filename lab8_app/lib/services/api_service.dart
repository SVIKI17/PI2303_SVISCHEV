import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/news.dart';
import '../models/cat_image.dart';

class ApiService {
  static const String _catsUrl = 'https://api.thecatapi.com/v1/images/search?limit=20';
  static const String _newsUrl = 'https://kubsau.ru/api/getNews.php?key=6df2f5d38d4e16b5a923a6d4873e2ee295d0ac90';

  Future<List<CatImage>> fetchCatImages() async {
    final response = await http.get(Uri.parse(_catsUrl));

    if (response.statusCode == 200) {
      return compute(parseCats, response.body);
    } else {
      throw Exception('Ошибка загрузки: ${response.statusCode}');
    }
  }

  static List<CatImage> parseCats(String responseBody) {
    final List<dynamic> parsed = jsonDecode(responseBody);
    return parsed.map((json) => CatImage.fromJson(json)).toList();
  }

  Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(_newsUrl));

    if (response.statusCode == 200) {
      return compute(parseNews, response.body);
    } else {
      throw Exception('Ошибка загрузки: ${response.statusCode}');
    }
  }

  static List<News> parseNews(String responseBody) {
    final List<dynamic> parsed = jsonDecode(responseBody);
    return parsed.map((json) => News.fromJson(json)).toList();
  }
}