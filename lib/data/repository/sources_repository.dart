import 'package:dailynews/data/web_services/sources_web_services.dart';
import 'package:dailynews/models/source_model.dart';

import 'package:dio/dio.dart';

class SourcesRepository {
  final SourcesWebService sourcesWebService;
  SourcesRepository(this.sourcesWebService);

  Future getSource() async {
    try {
      final Response getSourceResponse = await sourcesWebService.getSources();

      if (getSourceResponse.statusCode == 200) {
        final data = getSourceResponse.data;
        List<SourceModel> listSources = [];
        for (var source in (data['sources'] as List)) {
          listSources.add(SourceModel.fromJson(source));
        }
        return listSources;
      }
      if (getSourceResponse.statusCode == 500) {
        return 'Suppression';
      }
      if (getSourceResponse.statusCode == 400) {
        return getSourceResponse.data.toString();
      }
      if (getSourceResponse.statusCode == 401) {
        return 'Token';
      }
      if (getSourceResponse.statusCode == 403) {
        return 'Premession';
      }
      return "Erreur de connexion, veuillez réessayer";
    } catch (e) {
      return "Erreur de connexion, veuillez réessayer $e";
    }
  }
}
