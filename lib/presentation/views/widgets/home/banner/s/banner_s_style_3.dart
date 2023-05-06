import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../app/app_constants.dart';
import '../../../../../../app/resources/values/app_size.dart';
import 'banner_s.dart';

class BannerSStyle3 extends StatelessWidget {
  const BannerSStyle3({
    Key? key,
    this.image = "https://i.imgur.com/dBrsD0M.png",
    required this.title,
    this.subTitle,
    required this.press,
  }) : super(key: key);

  final String image, title;
  final String? subTitle;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BannerS(
      image: image,
      press: press,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (subTitle != null)
                      Text(
                        subTitle!,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: grandisExtendedFont,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    if (subTitle != null) const SizedBox(height: AppSize.s4),
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        fontFamily: grandisExtendedFont,
                        color: Colors.white,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w900,
                        height: 1,
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: press,
                child: const Text(
                  "Shop now  >",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
