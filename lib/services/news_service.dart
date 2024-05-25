import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machers_assignment/models/news_article.dart';
import 'package:machers_assignment/utils/api_endpoints.dart';

class NewsService {
  Future<List<NewsArticle>> fetchNews(String category, String country) async {
    final response = await http
        .get(Uri.parse('${ApiEndpoints.newsApiUrl}$category/$country.json'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['articles'];
      return data.map((json) => NewsArticle.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
