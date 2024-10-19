import 'dart:io';

import 'package:dailynews/models/news_model.dart';
import 'package:dailynews/presentation/constants/strings/strings.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveBase {
  static HiveBase hiveBase = HiveBase();

  late Box news;

  static Future init() async {
    Directory directory = await getApplicationDocumentsDirectory();

    Hive.init(directory.path);

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(NewsModelAdapter());
    }

    hiveBase.news = await Hive.openBox(newsBoxHive);
  }

  Future<void> setNews(List<NewsModel> newsInfo) async =>
      await news.put(newsHiveKey, newsInfo);

  List getNews() => news.get(newsHiveKey);

  void removeNews() => news.delete(newsHiveKey);
}
