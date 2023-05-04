import 'package:flutter/material.dart';

import '../../../../app/resources/colors/color_manager.dart';
import '../../../../app/resources/values/app_size.dart';
import 'categories.dart';
import 'offers_carousel.dart';

class OffersCarouselAndCategories extends StatelessWidget {
  const OffersCarouselAndCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OffersCarousel(),
        const SizedBox(height: AppSize.s8),
        Padding(
          padding: const EdgeInsets.all(AppSize.s16),
          child: Text(
            "Categories",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: ColorManager.grey),
          ),
        ),
        const Categories(),
      ],
    );
  }
}
