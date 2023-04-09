import 'package:flutter/material.dart';

import 'app_strings.dart';
import 'resources/routes/router_manager.dart';
import 'themes/theme_manager.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  // named constructor
  MyApp._internal();

  int appState = 0;

  static final MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: getApplicationTheme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
