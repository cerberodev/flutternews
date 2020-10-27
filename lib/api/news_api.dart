import 'dart:convert';

import 'package:flutternews/models/article_model.dart';
import 'package:flutternews/secret/secret.dart';
import 'package:http/http.dart' as http;

class NewsColombia {
  List<Article> newsCol = [];
  Future<void> getNewsColombia() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=co&apiKey=$apiKey';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['aticles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publshedAt']),
            content: element['content'],
            articleUrl: element['articleUrl'],
          );
          newsCol.add(article);
        }
      });
      return newsCol;
    }
  }
}

class NewsEsApi {
  List<Article> newsEsApi = [];
  Future<void> getNewsEs() async {
    String url =
        'https://newsapi.org/v2/top-headlines?language=es&apiKey=$apiKey';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['aticles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publshedAt']),
            content: element['content'],
            articleUrl: element['articleUrl'],
          );
          newsEsApi.add(article);
        }
      });
      return newsEsApi;
    }
  }
}
