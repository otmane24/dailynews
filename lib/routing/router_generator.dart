import 'package:dailynews/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../app/app.dart';
import 'app_routing.dart';

class RouterGenerator {
  static Route<dynamic> getRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouter.homeRouter:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const MyApp(),
        );
    }
  }
}
