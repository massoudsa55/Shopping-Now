import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/resources/values/app_size.dart';
import '../../../../domain/models/product_model.dart';
import 'product/product_card.dart';
import 'title_of_items.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s8),
        const Padding(
          padding: EdgeInsets.all(AppSize.s16),
          child: TitleOfItems(title: "Popular products", fontSize: AppSize.s18),
        ),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: demoPopularProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: AppSize.s16,
                right:
                    index == demoPopularProducts.length - 1 ? AppSize.s16 : 0,
              ),
              child: ProductCard(
                product: demoPopularProducts[index],
                press: () {},
              ),
            ),
          ),
        )
      ],
    );
  }
}
