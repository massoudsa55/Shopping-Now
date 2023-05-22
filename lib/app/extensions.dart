import 'package:flutter/material.dart';

import 'app_constants.dart';

extension NonNullString on String? {
  String orEmpty() => this == null ? AppConstants.empty : this!;
}

extension NonNullInteger on int? {
  int orZero() => this == null ? AppConstants.zero : this!;
}

extension MediaQueryExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension NavigatorExtension on BuildContext {
  push(Widget widget) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => widget));

  pushNamed(String routeName) => Navigator.of(this).pushNamed(routeName);

  pushReplacement(Widget widget) => Navigator.of(this)
      .pushReplacement(MaterialPageRoute(builder: (_) => widget));

  pushAndRemoveUntil(Widget widget) => Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => widget), (route) => false);

  pushNamedAndRemoveUntil(String routeName) =>
      Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false);

  pushReplacementNamed(String routeName) =>
      Navigator.of(this).pushReplacementNamed(routeName);

  pop() => Navigator.of(this).pop();

  popAndPushNamed(String routeName) =>
      Navigator.of(this).popAndPushNamed(routeName);

  popUntil() => Navigator.of(this).popUntil((route) => false);
}
