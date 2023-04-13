import 'package:dots_indicator/dots_indicator.dart';
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
        OnBoardingModel(
          AppStrings.onBoardingTitle1,
          AppStrings.onBoardingSubTitle1,
          ImageAssets.onBoardingLogo1,
          AppStrings.next,
        ),
        OnBoardingModel(
          AppStrings.onBoardingTitle2,
          AppStrings.onBoardingSubTitle2,
          ImageAssets.onBoardingLogo2,
          AppStrings.next,
        ),
        OnBoardingModel(
          AppStrings.onBoardingTitle3,
          AppStrings.onBoardingSubTitle3,
          ImageAssets.onBoardingLogo3,
          AppStrings.next,
        ),
        OnBoardingModel(
          AppStrings.onBoardingTitle4,
          AppStrings.onBoardingSubTitle4,
          ImageAssets.onBoardingLogo4,
          AppStrings.getStarted,
        ),
      ];

  next() {
    _currentIndex++;
    if (_currentIndex > _list.length - 1) {
    } else {
      _pageController.animateToPage(_currentIndex,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.darkGrey,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _list.length,
            onPageChanged: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            itemBuilder: (context, index) =>
                OnBoardingPage(onBoardingModel: _list[index]),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSize.s20),
              child: Column(
                children: [
                  DotsIndicator(
                    dotsCount: _list.length,
                    position: _currentIndex.toDouble(),
                    decorator: DotsDecorator(
                      size: const Size.square(AppSize.s8),
                      activeSize: const Size(AppSize.s8, AppSize.s20),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s4)),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          next();
                        });
                      },
                      child: Text(
                        _list[_currentIndex].txtButton,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: ColorManager.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
    required this.onBoardingModel,
  }) : super(key: key);

  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: AppSize.s10, horizontal: AppSize.s10),
      margin: const EdgeInsets.symmetric(
          vertical: AppSize.s10, horizontal: AppSize.s10),
      child: Column(
        children: [
          SizedBox(
            // width: AppSize.s20 * 15,
            height: size.height * 0.35,
            child: SvgPicture.asset(onBoardingModel.image),
            // child: Image.asset(onBoardingModel.image),
          ),
          const SizedBox(height: AppSize.s20),
          Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: Text(
              onBoardingModel.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: Text(
              onBoardingModel.subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingModel {
  final String title;
  final String subTitle;
  final String image;
  final String txtButton;

  OnBoardingModel(this.title, this.subTitle, this.image, this.txtButton);
}
