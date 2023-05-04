import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/resources/colors/color_manager.dart';
import '../../../../app/resources/values/app_size.dart';
import '../../../../domain/models/product_model.dart';
import 'product/product_card.dart';

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
        Padding(
          padding: const EdgeInsets.all(AppSize.s16),
          child: Text(
            "Popular products",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: ColorManager.grey),
          ),
        ),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Find demoPopularProducts on models/ProductModel.dart
            itemCount: demoPopularProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: AppSize.s16,
                right:
                    index == demoPopularProducts.length - 1 ? AppSize.s16 : 0,
              ),
              child: ProductCard(
                image: demoPopularProducts[index].image,
                brandName: demoPopularProducts[index].brandName,
                title: demoPopularProducts[index].title,
                price: demoPopularProducts[index].price,
                priceAfetDiscount: demoPopularProducts[index].priceAfetDiscount,
                dicountpercent: demoPopularProducts[index].dicountpercent,
                press: () {},
              ),
            ),
          ),
        )
      ],
    );
  }
}
