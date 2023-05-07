import 'package:flutter/material.dart';

import '../../../presentation/views/screens/auth/login/login_screen.dart';
import '../../../presentation/views/screens/home/home_screen.dart';
import '../../../presentation/views/screens/home/payment/payment_screen.dart';
import '../../../presentation/views/screens/home/payment/payment_success_screen.dart';
import '../../../presentation/views/screens/splashscreen/splash_screen.dart';
import '../../../presentation/views/screens/onboarding/onboarding_view.dart';
import '../../../presentation/views/screens/start_screen.dart';
import 'routes_manager.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case AppRoutes.loginScreenRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.startScreenRoute:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case AppRoutes.paymentScreenRoute:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case AppRoutes.paymentSuccessScreenRoute:
        return MaterialPageRoute(builder: (_) => const PaymentSuccessScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route unDefinedRoute() {
    // TODO: create this page for not found
    return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
