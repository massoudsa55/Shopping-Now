import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../app/app_constants.dart';
import '../../../../app/resources/assets/image_assets.dart';
import '../../../../app/resources/colors/color_manager.dart';
import '../../../../app/resources/routes/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDisplay() {
    _timer = Timer(
        const Duration(seconds: AppConstants.splashScreenDelay), _nextDisplay);
  }

  @override
  void initState() {
    _startDisplay();
    super.initState();
  }

  void _nextDisplay() {
    Navigator.pushReplacementNamed(context, AppRoutes.onBoardingRoute);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: ColorManager.primary,
      // body: Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Lottie.asset("assets/images/splash_screen.json"),
          ),
          SvgPicture.asset("assets/icons/shoplon.svg"),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
