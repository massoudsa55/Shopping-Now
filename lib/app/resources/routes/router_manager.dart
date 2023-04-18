import 'package:flutter/material.dart';

import '../../../presentation/views/screens/auth/login/login_screen.dart';
import '../../../presentation/views/screens/splashscreen/splash_screen.dart';
import '../../../presentation/views/screens/onboarding/onboarding_view.dart';
import 'routes_manager.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case AppRoutes.loginScreenRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route unDefinedRoute() {
    // TODO: create this page for not found
    return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
