import 'package:flutter/material.dart';
import 'package:shopping_now/app/resources/fonts/font_size.dart';
import 'package:shopping_now/app/resources/fonts/font_weight_manager.dart';

class AppStyles {}

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

// light style
TextStyle getLightStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.bold, color);

// simple style
TextStyle getSimpleStyle(
        {double fontSize = FontSize.s10, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.bold, color);

// lable small style
TextStyle getSmallStyle(
        {double fontSize = FontSize.s8, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.bold, color);

// regular style
TextStyle getRegularStyle(
        {double fontSize = FontSize.s14, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.regular, color);

// medium style
TextStyle getMediumStyle(
        {double fontSize = FontSize.s16, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.medium, color);

// semiBold style
TextStyle getSemiBoldStyle(
        {double fontSize = FontSize.s18, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.semiBold, color);

// bold style
TextStyle getBoldStyle(
        {double fontSize = FontSize.s20, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.bold, color);
