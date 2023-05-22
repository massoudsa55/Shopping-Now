import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/app_constants.dart';
import '../../../../app/resources/colors/color_manager.dart';
import '../../../../app/resources/values/app_size.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
    this.activeColor = ColorManager.primary,
    this.inActiveColor = ColorManager.lightGrey,
    this.activeHeight = AppSize.s12,
    this.inActiveHeight = AppSize.s4,
    this.width = AppSize.s4,
  }) : super(key: key);

  final bool isActive;
  final Color? inActiveColor, activeColor;
  final double activeHeight, inActiveHeight, width;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: defaultDuration,
      height: isActive ? activeHeight.h : inActiveHeight.h,
      width: width.w,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inActiveColor,
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
      ),
    );
  }
}
