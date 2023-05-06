import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../app/app_constants.dart';
import '../../../../../../app/resources/values/app_size.dart';
import '../banner_discount_tag.dart';

import 'banner_s.dart';

class BannerSStyle1 extends StatelessWidget {
  const BannerSStyle1({
    Key? key,
    this.image = "https://i.imgur.com/K41Mj7C.png",
    required this.title,
    required this.press,
    this.subtitle,
    required this.discountParcent,
  }) : super(key: key);
  final String? image;
  final String title;
  final String? subtitle;
  final int discountParcent;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BannerS(
      image: image!,
      press: press,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSize.s16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        fontFamily: grandisExtendedFont,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: AppSize.s4),
                    if (subtitle != null)
                      Text(
                        subtitle!.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: AppSize.s16),
              SizedBox(
                height: 45.h,
                width: 45.w,
                child: ElevatedButton(
                  onPressed: press,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/right_arrow.svg",
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: BannerDiscountTag(
            percentage: discountParcent,
            height: 45.h,
          ),
        ),
      ],
    );
  }
}
