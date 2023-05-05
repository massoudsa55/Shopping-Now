import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../app/resources/values/app_size.dart';
import '../../../../../app/app_constants.dart';

class BannerDiscountTag extends StatelessWidget {
  const BannerDiscountTag({
    Key? key,
    this.width = 36,
    this.height = 60,
    required this.percentage,
    this.percentageFontSize = AppSize.s10,
  }) : super(key: key);
  final double width, height;
  final int percentage;
  final double percentageFontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/discount_tag.svg",
            fit: BoxFit.fill,
            color: Colors.white70,
          ),
          Text(
            "$percentage%\noff",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: grandisExtendedFont,
              color: Colors.black54,
              fontSize: percentageFontSize,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
