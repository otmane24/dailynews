import 'package:dailynews/presentation/constants/strings/strings.dart';
import 'package:dio/dio.dart';

class NewsWebService {
  Dio? dio;

  NewsWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 120),
      receiveTimeout: const Duration(seconds: 120),
      sendTimeout: const Duration(seconds: 120),
      headers: {
        'content-type': 'application/json',
      },
    );
    dio = Dio(options);
  }

  Future<Response> getNews(
      {required int page, String? source, String? from, String? to}) async {
    try {
      var response = await dio!.get(
        '/everything?q=all&${source != null ? "sources=$source&" : ""}${from != null ? "from=$from&" : ""}${to != null ? "to=$to&" : ""}sortBy=publishedAt&pageSize=10&page=$page&apiKey=$apiKey',
      );

      return response;
    } on DioException catch (e) {
      print("error webservice $e");
      if (e.response != null) {
        return e.response!;
      } else {
        return Response(requestOptions: RequestOptions(path: 'path'));
      }
    }
  }
}
