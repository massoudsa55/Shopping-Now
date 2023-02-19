import 'dart:async';

import 'package:flutter/material.dart';

import '../../app/resources/assets/image_assets.dart';
import '../../app/resources/colors/color_manager.dart';
import '../../app/resources/constants/app_constants.dart';
import '../../app/resources/routes/routes_manager.dart';

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
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
