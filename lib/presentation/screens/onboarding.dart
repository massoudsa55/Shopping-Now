import 'package:flutter/material.dart';

import '../../app/resources/colors/color_manager.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightPrimary,
      body: const Center(
        child: Text("On Boarding"),
      ),
    );
  }
}
