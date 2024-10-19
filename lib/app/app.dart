import 'dart:io';

import 'package:dailynews/assistant_methode/size_config.dart';
import 'package:dailynews/businnes_logic/cubit/internet/internet_cubit.dart';
import 'package:dailynews/routing/router_generator.dart';
import 'package:dailynews/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocProvider(
      create: (context) => InternetCubit(),
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245)),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouterGenerator.getRouter,
        home: const SplashScreen(),
      ),
    );
  }
}
