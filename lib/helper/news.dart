import 'dart:convert';

import 'package:flutter_news_app/model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=c5b37a1fb38b40e99523c8d6678b0a04'));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if ((element['urlToImage'] != null && element['description'] != null)) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=c5b37a1fb38b40e99523c8d6678b0a04'));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if ((element['urlToImage'] != null && element['description'] != null)) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
