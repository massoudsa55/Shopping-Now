import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../app/app_strings.dart';
import '../../app/resources/assets/image_assets.dart';
import '../../app/resources/routes/routes_manager.dart';
import '../../domain/models/models.dart';
import '../bases/base_viewmodel.dart';

abstract class OnBoardingViewModelInputs {
  int next(BuildContext context);
  onPageChanged(int index);
  Sink get inputOnBoardingModel;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputsOnBoardingModel;
}

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  late final List<OnBoardingModel> _list;
  late final StreamController<SliderViewObject> _streamController =
      StreamController<SliderViewObject>();
  int _currentIndex = 0;

  @override
  void start() {
    _list = _getOnBoardingList();
    _postDataToView();
  }

  @override
  Sink get inputOnBoardingModel => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputsOnBoardingModel =>
      _streamController.stream.map((onBoardingModel) => onBoardingModel);

  @override
  int next(BuildContext context) {
    _currentIndex++;
    if (_currentIndex == _list.length) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreenRoute);
      _currentIndex = 0;
    }
    return _currentIndex;
  }

  @override
  onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  // onboarding private functions
  void _postDataToView() {
    _streamController.add(SliderViewObject(
        _getOnBoardingList()[_currentIndex], _list.length, _currentIndex));
  }

// use data statics
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
}
