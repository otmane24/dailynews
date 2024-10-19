import 'package:dailynews/presentation/constants/strings/strings.dart';
import 'package:dio/dio.dart';

class SourcesWebService {
  Dio? dio;

  SourcesWebService() {
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

  Future<Response> getSources() async {
    try {
      var response = await dio!.get(
        '/top-headlines/sources?apiKey=$apiKey',
      );

      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response!;
      } else {
        return Response(requestOptions: RequestOptions(path: 'path'));
      }
    }
  }
}
