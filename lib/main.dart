import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  await HiveBase.init();

  runApp(
    const MyApp(),
  );
}
