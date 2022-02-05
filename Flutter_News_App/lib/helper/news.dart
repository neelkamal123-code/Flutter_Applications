import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Flutter_News_App/models/article_model.dart';

class News {
  List<ArticleModel> news = [];



  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=ae93347137b64c0687eeeb3caa454638";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      for (var element in jsonData['articles']) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            content: element['content'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            url: element['url'],
            publishedAt: element['publishedAt'],
          );
          news.add(articleModel);
        }
      }
    }
  }
}




class CategoryNewsClass {
  List<ArticleModel> news = [];



  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=ae93347137b64c0687eeeb3caa454638";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      for (var element in jsonData['articles']) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            content: element['content'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            url: element['url'],
            publishedAt: element['publishedAt'],
          );
          news.add(articleModel);
        }
      }
    }
  }
}
