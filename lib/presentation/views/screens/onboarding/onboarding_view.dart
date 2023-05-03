import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/app_constants.dart';
import '../../../../app/app_preference.dart';
import '../../../../app/dependency_injection.dart';
import '../../../../app/resources/colors/color_manager.dart';
import '../../../../app/resources/values/app_size.dart';
import '../../../../domain/models/models.dart';
import '../../../viewmodels/onboarding_viewmodel.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  // final AppPreferences _appPreferences = instance<AppPreferences>();

  _startOnBoardingViewModel() {
    // _appPreferences.setOnBoardingScreenViewed();
    _viewModel.start();
  }

  @override
  void initState() {
    _startOnBoardingViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputsOnBoardingModel,
      builder: (context, snapshot) => getOnBoardingScreen(snapshot.data),
    );
  }

  Widget getOnBoardingScreen(SliderViewObject? sliderViewObject) {
    Size size = MediaQuery.of(context).size;
    if (sliderViewObject == null) {
      return const Center(child: CircularProgressIndicator());
    }
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
            itemCount: sliderViewObject.numOfSlides,
            onPageChanged: (index) {
              _viewModel.onPageChanged(index);
            },
            itemBuilder: (context, index) => OnBoardingPage(
                onBoardingModel: sliderViewObject.onBoardingModel),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSize.s20),
              child: Column(
                children: [
                  DotsIndicator(
                    dotsCount: sliderViewObject.numOfSlides,
                    position: sliderViewObject.currentIndex.toDouble(),
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
                        _pageController.animateToPage(_viewModel.next(context),
                            duration: onboardingDuration,
                            curve: onboardingCurve);
                      },
                      child: Text(
                        sliderViewObject.onBoardingModel.txtButton,
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

  @override
  void dispose() {
    _viewModel.dispose();
    _pageController.dispose();
    super.dispose();
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
