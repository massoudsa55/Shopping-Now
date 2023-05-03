import 'dart:async';

import '../../app/app_strings.dart';
import '../../app/resources/assets/image_assets.dart';
import '../../domain/models/models.dart';

class OnBoardingBloc {
  final _onBoardingController = StreamController<List<OnBoardingModel>>();

  Stream<List<OnBoardingModel>> get onBoardingStream =>
      _onBoardingController.stream;

  void fetchOnBoarding() {
    final onBoarding = [
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

    _onBoardingController.add(onBoarding);
  }

  void dispose() {
    _onBoardingController.close();
  }
}
