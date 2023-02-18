import 'package:flutter/material.dart';

import '../../../presentation/screens/splash_screen.dart';
import 'routes_manager.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route unDefinedRoute() {
    // TODO: create this page for not found
    return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
