// import 'package:firebase_auth/firebase_auth.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/app_constants.dart';
import '../../../../app/extensions.dart';
import '../../../../app/resources/colors/color_manager.dart';
import '../../../../app/resources/values/app_size.dart';
import '../../../../domain/models/models.dart';
import '../../../viewmodels/onboarding_viewmodel.dart';
import '../../widgets/home/dot_indicators.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final PageController _pageController = PageController();
  final OnBoardingViewModel viewModel = OnBoardingViewModel();
  // final AppPreferences _appPreferences = instance<AppPreferences>();

  _startOnBoardingViewModel() {
    // _appPreferences.setOnBoardingScreenViewed();
    viewModel.start();
  }

  @override
  void initState() {
    _startOnBoardingViewModel();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: viewModel.outputsOnBoardingModel,
      builder: (context, snapshot) => getOnBoardingScreen(snapshot.data),
    );
  }

  Widget getOnBoardingScreen(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
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
              viewModel.onPageChanged(index);
            },
            itemBuilder: (context, index) => OnBoardingPage(
                onBoardingModel: sliderViewObject.onBoardingModel),
          ),
          Positioned(
            bottom: AppSize.s20,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSize.s20),
              child: Column(
                children: [
                  Row(
                    children: List.generate(
                      sliderViewObject.numOfSlides,
                      (index) => Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: AppSize.s4),
                        child: DotIndicator(
                          activeHeight: AppSize.s16,
                          inActiveHeight: AppSize.s6,
                          width: AppSize.s6,
                          isActive:
                              index == sliderViewObject.currentIndex.toDouble(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: context.height * 0.05),
                  SizedBox(
                    width: context.width * 0.7,
                    height: context.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.animateToPage(viewModel.next(context),
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
    return FadeInDown(
      duration: const Duration(milliseconds: 800),
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: AppSize.s10, horizontal: AppSize.s10),
        margin: const EdgeInsets.symmetric(
            vertical: AppSize.s10, horizontal: AppSize.s10),
        child: SingleChildScrollView(
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
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: ColorManager.primary,
                      ),
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
        ),
      ),
    );
  }
}
