import 'package:flutter/material.dart';

import '../../../../../app/resources/values/app_size.dart';
import 's/banner_s_style_1.dart';
import 's/banner_s_style_4.dart';

class GetBanners extends StatelessWidget {
  const GetBanners({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BannerSStyle1(
          title: "New \narrival",
          subtitle: "SPECIAL OFFER",
          discountParcent: 50,
          press: () {},
        ),
        const SizedBox(height: AppSize.s16 / 4),
        BannerSStyle4(
          title: "SUMMER \nSALE",
          subtitle: "SPECIAL OFFER",
          bottomText: "UP TO 80% OFF",
          press: () {},
        ),
        const SizedBox(height: AppSize.s16 / 4),
        BannerSStyle4(
          image: "https://i.imgur.com/dBrsD0M.png",
          title: "Black \nfriday",
          subtitle: "50% off",
          bottomText: "Collection".toUpperCase(),
          press: () {},
        ),
      ],
    );
  }
}
