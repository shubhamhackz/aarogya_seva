import 'package:covid/constants/apikeys.dart';
import 'package:covid/model/articles/articles.dart';
import 'package:covid/services/network_service.dart';

class TopheadlinesData {
  String url =
      'https://newsapi.org/v2/top-headlines?country=in&q=covid-19&apiKey=$newsApiKey';
  List<Article> headlines = [];

  refresh() async {
    var headlinesData = await NetworkService.fetchData(url);
    List articles = headlinesData['articles'];
    articles.forEach((article) {
      headlines.add(Article(
          author: article['author'],
          title: article['title'],
          description: article['description'],
          url: article['url'],
          urlToImage: article['urlToImage'],
          publishedAt: article['publishedAt'],
          content: article['content']));
    });
    headlines.forEach((element) {
      print('Title : ${element.title}');
    });
  }
}
