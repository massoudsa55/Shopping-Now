import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/app_strings.dart';
import '../../app/resources/assets/image_assets.dart';
import '../../app/resources/colors/color_manager.dart';
import '../../app/resources/values/app_size.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late final List<OnBoardingModel> _list = _getOnBoardingList();
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<OnBoardingModel> _getOnBoardingList() => [
        OnBoardingModel(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
        OnBoardingModel(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
        OnBoardingModel(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
        OnBoardingModel(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onBoardingLogo4),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightPrimary,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(
              vertical: AppSize.s10, horizontal: AppSize.s10),
          child: Column(
            children: [
              // SvgPicture.assets(""),
              SvgPicture.asset(_list[index].image),
              const SizedBox(height: AppSize.s20),
              Padding(
                padding: const EdgeInsets.all(AppSize.s8),
                child: Text(
                  _list[index].title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSize.s8),
                child: Text(
                  _list[index].subTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingModel {
  final String title;
  final String subTitle;
  final String image;

  OnBoardingModel(this.title, this.subTitle, this.image);
}
