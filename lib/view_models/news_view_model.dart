import 'package:flutter/material.dart';
import 'package:machers_assignment/models/news_article.dart';
import 'package:machers_assignment/services/news_service.dart';

class NewsViewModel extends ChangeNotifier {
  List<NewsArticle> _articles = [];
  bool _loading = false;

  List<NewsArticle> get articles => _articles;
  bool get loading => _loading;

  Future<void> fetchNews(String category, String country) async {
    _loading = true;
    notifyListeners();

    _articles = await NewsService().fetchNews(category, country);
    _loading = false;
    notifyListeners();
  }
}
