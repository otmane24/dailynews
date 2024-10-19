import 'package:dailynews/app/app.dart';
import 'package:dailynews/assistant_methode/hivebase.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveBase.init();

  runApp(
    const MyApp(),
  );
}
