import 'dart:convert';

import 'package:flutternews/core/models/article_model.dart';
import 'package:flutternews/secret/secret.dart';
import 'package:http/http.dart' as http;

class CategoryApi {
  List<Article> newsCategory = [];

  Future<void> getNewsCategory(String category) async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apiKey';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['aticles'].forEach((element) {
        if (element['urlImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publshedAt']),
            // DataTime.utc()
            // 2020-10-30 10:29:45
            // DataTime.now()
            content: element['content'],
            articleUrl: element['articleUrl'],
          );
          newsCategory.add(article);
        }
      });
    }
  }
}
