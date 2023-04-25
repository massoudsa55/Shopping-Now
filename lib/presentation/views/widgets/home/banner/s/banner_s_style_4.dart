import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../app/app_constants.dart';
import '../../../../../../app/resources/values/app_size.dart';
import 'banner_s.dart';

class BannerSStyle4 extends StatelessWidget {
  const BannerSStyle4({
    Key? key,
    this.image = "https://i.imgur.com/vx3FfTJ.png",
    required this.title,
    required this.press,
    this.subtitle,
    this.bottomText,
  }) : super(key: key);
  final String? image;
  final String title;
  final String? subtitle, bottomText;

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
                    if (subtitle != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.s16 / 2,
                            vertical: AppSize.s16 / 8),
                        color: Colors.white70,
                        child: Text(
                          subtitle!,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    const SizedBox(height: AppSize.s16 / 2),
                    Text(
                      title.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: grandisExtendedFont,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                    // const SizedBox(height: AppSize.s16 / 4),
                    if (bottomText != null)
                      Text(
                        bottomText!,
                        style: const TextStyle(
                          fontFamily: grandisExtendedFont,
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(width: AppSize.s16),
              SizedBox(
                height: 48,
                width: 48,
                child: ElevatedButton(
                  onPressed: press,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Arrow - Right.svg",
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}