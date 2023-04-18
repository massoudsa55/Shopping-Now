import 'dart:async';

import 'package:flutter/material.dart';

import '../../app/app_strings.dart';
import '../../app/resources/assets/image_assets.dart';
import '../../domain/models.dart';
import '../bases/base_viewmodel.dart';

abstract class OnBoardingViewModelIputs {
  next();
  Sink get inputOnBoardingModel;
}

abstract class OnBoardingViewModelOutputs {
  Stream<OnBoardingModel> get outputsOnBoardingModel;
}

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelIputs, OnBoardingViewModelOutputs {
  late final List<OnBoardingModel> _list;
  late final PageController _pageController;
  late final StreamController<OnBoardingModel> _streamController;
  int _currentIndex = 0;

  @override
  next() {
    _currentIndex++;
    if (_currentIndex > _list.length - 1) {
      // TODO: implement code for navigate to login screen
      // Navigator.;
      _currentIndex = 0;
    } else {
      _pageController.animateToPage(_currentIndex,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _streamController.close();
  }

  @override
  void start() {
    _list = _getOnBoardingList();
    _pageController = PageController();
    _streamController = StreamController<OnBoardingModel>();
  }

  @override
  Sink get inputOnBoardingModel => _streamController.sink;

  @override
  Stream<OnBoardingModel> get outputsOnBoardingModel =>
      _streamController.stream.map((onBoardingModel) => onBoardingModel);
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
