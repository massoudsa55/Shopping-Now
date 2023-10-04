import 'package:flutter/material.dart';

import '../../../presentation/views/screens/auth/login/login_screen.dart';
import '../../../presentation/views/screens/auth/register/register_screen.dart';
import '../../../presentation/views/screens/home/home_screen.dart';
import '../../../presentation/views/screens/home/payment/payment_screen.dart';
import '../../../presentation/views/screens/home/payment/payment_success_screen.dart';
import '../../../presentation/views/screens/home/profile/details_profile_screen.dart';
import '../../../presentation/views/screens/home/profile/edit_profile.dart';
import '../../../presentation/views/screens/home/search/search_screen.dart';
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
      case AppRoutes.registerScreenRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case AppRoutes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.startScreenRoute:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case AppRoutes.paymentScreenRoute:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case AppRoutes.paymentSuccessScreenRoute:
        return MaterialPageRoute(builder: (_) => const PaymentSuccessScreen());
      case AppRoutes.searchScreenRoute:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case AppRoutes.detailsProfileRoute:
        return MaterialPageRoute(builder: (_) => const DetailsProfile());
      case AppRoutes.editProfileRoute:
        return MaterialPageRoute(builder: (_) => const EditProfile());
      // case AppRoutes.categoryOfDiscoverScreenRoute:
      //   return MaterialPageRoute(
      //       builder: (_) => const CategoryOfDiscoverScreen(categoryName: ""));
      default:
        return unDefinedRoute();
    }
  }

  static Route unDefinedRoute() {
    return MaterialPageRoute(builder: (_) => const NoThing());
  }
}

class NoThing extends Widget {
  const NoThing({super.key});
  @override
  Element createElement() => _NoThingElement(this);
}

class _NoThingElement extends Element {
  _NoThingElement(super.widget);

  @override
  bool get debugDoingBuild => false;

  @override
  void performRebuild() {
    super.performRebuild();
  }
}
