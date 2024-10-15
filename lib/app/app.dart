import 'dart:io';

import 'package:dailynews/assistant_methode/size_config.dart';
import 'package:dailynews/routing/router_generator.dart';
import 'package:dailynews/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return MaterialApp(
      theme: ThemeData(),
      locale: Locale(Platform.localeName.split('_')[0]),
      supportedLocales: [Locale(Platform.localeName.split('_')[0])],
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterGenerator.getRouter,
      home: const SplashScreen(),
    );
  }
}
