import 'package:dailynews/data/web_services/news_web_services.dart';
import 'package:dailynews/models/news_model.dart';
import 'package:dailynews/presentation/constants/strings/strings.dart';
import 'package:dio/dio.dart';

class NewsRepository {
  final NewsWebService newsWebService;
  NewsRepository(this.newsWebService);

  Future getNews(
      {required int page, String? source, String? from, String? to}) async {
    try {
      final Response getNewsResponse = await newsWebService.getNews(
          page: page, source: source, from: from, to: to);

      if (getNewsResponse.statusCode == 200) {
        final data = getNewsResponse.data;
        List<NewsModel> listNews = [];

        for (var news in (data['articles'] as List)) {
          if (news['title'] != "[Removed]" && news['description'] != null) {
            listNews.add(NewsModel.fromJson(news));
          }
        }
        nbrNews = data['totalResults'];
        return listNews;
      }
      if (getNewsResponse.statusCode == 500) {
        return 'Suppression';
      }
      if (getNewsResponse.statusCode == 400) {
        return getNewsResponse.data.toString();
      }
      if (getNewsResponse.statusCode == 401) {
        return 'Token';
      }
      if (getNewsResponse.statusCode == 403) {
        return 'Premession';
      }
      if (getNewsResponse.statusCode == 429) {
        return getNewsResponse.data['message'];
      }
      return "Erreur de connexion, veuillez réessayer";
    } catch (e) {
      return "Erreur de connexion, veuillez réessayer $e";
    }
  }
}
