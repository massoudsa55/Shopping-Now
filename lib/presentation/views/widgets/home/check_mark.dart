import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/app_constants.dart';
import '../../../../app/resources/values/app_size.dart';

class CheckMark extends StatelessWidget {
  const CheckMark({
    Key? key,
    this.radious = AppSize.s8,
    this.activeColor = primaryColor,
    this.iconColor = Colors.white,
    this.padding = const EdgeInsets.all(AppSize.s2),
  }) : super(key: key);
  final double radious;
  final Color activeColor, iconColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 8,
      backgroundColor: activeColor,
      child: Padding(
        padding: padding,
        child: SvgPicture.asset(
          // "assets/icons/Singlecheck.svg",
          "assets/icons/man.svg",
          color: iconColor,
        ),
      ),
    );
  }
}
