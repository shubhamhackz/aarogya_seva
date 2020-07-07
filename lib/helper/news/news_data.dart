import 'package:covid/constants/apikeys.dart';
import 'package:covid/model/articles/articles.dart';
import 'package:covid/services/network_service.dart';

class NewsData {
  List<Article> articles = [];
  String url =
      'https://newsapi.org/v2/everything?q=covid-19&sortBy=publishedAt&from=2020-06-29&language=en&apiKey=$newsApiKey';
  refresh() async {
    var data = await NetworkService.fetchData(url);
    List newsData = data['articles'];
    newsData.forEach((article) {
      if (article['title'] != null &&
          article['url'] != null &&
          article['urlToImage'] != null &&
          article['content'] != null) {
        articles.add(Article(
          author: article['author'],
          title: article['title'],
          description: article['description'],
          url: article['url'],
          urlToImage: article['urlToImage'],
          publishedAt: article['publishedAt'],
          content: article['content'],
        ));
      }
    });
  }
}
