import 'package:flutter/material.dart';

import '../../../../app/resources/values/app_size.dart';
import 'categories.dart';
import 'offers_carousel.dart';
import 'title_of_items.dart';

class OffersCarouselAndCategories extends StatelessWidget {
  const OffersCarouselAndCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        OffersCarousel(),
        SizedBox(height: AppSize.s8),
        Padding(
          padding: EdgeInsets.all(AppSize.s16),
          child: TitleOfItems(title: "Categories"),
        ),
        Categories(),
      ],
    );
  }
}
