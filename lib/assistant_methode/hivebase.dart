import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveBase {
  static HiveBase hiveBase = HiveBase();

  late Box news;

  static Future init() async {
    Directory directory = await getApplicationDocumentsDirectory();

    Hive.init(directory.path);

    // if (!Hive.isAdapterRegistered(1)) {
    //   Hive.registerAdapter(NewsAdapter());
    // }

    // hiveBase.news = await Hive.openBox(driverBoxHive);

    // Future<void> setNews(News newsInfo) async =>
    //     await news.put(driverHiveKey, newsInfo);

    // News getDriver() => news.get(driverHiveKey);

    // void removeNews() => news.delete(driverHiveKey);
  }
}
