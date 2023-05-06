import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../app/app_constants.dart';
import '../../../../../../app/resources/values/app_size.dart';
import 'banner_s.dart';

class BannerSStyle2 extends StatelessWidget {
  const BannerSStyle2(
      {Key? key,
      this.image = "https://i.imgur.com/taodfci.png",
      required this.title,
      this.subttile,
      this.bottomText,
      required this.press})
      : super(key: key);

  final String image, title;
  final String? subttile, bottomText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BannerS(
      image: image,
      press: press,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (subttile != null)
                Text(
                  subttile!,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: grandisExtendedFont,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (subttile != null) const SizedBox(height: AppSize.s4),
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontFamily: grandisExtendedFont,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              if (bottomText != null) const SizedBox(height: AppSize.s4),
              if (bottomText != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.s8,
                    vertical: AppSize.s4,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
                  ),
                  child: Text(
                    bottomText!.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black54,
                      fontFamily: grandisExtendedFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
