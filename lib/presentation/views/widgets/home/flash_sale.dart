import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/resources/values/app_size.dart';
import '../../../../domain/models/product_model.dart';
import 'Banner/m/banner_m_with_counter.dart';
import 'product/product_card.dart';
import 'title_of_items.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BannerMWithCounter(
          duration: const Duration(hours: 8),
          text: "Super Flash Sale \n50% Off",
          press: () {},
        ),
        const SizedBox(height: AppSize.s8),
        const Padding(
          padding: EdgeInsets.all(AppSize.s16),
          child: TitleOfItems(title: "Flash sale", fontSize: AppSize.s18),
        ),
        SizedBox(
          height: 190.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: demoFlashSaleProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: AppSize.s16,
                right:
                    index == demoFlashSaleProducts.length - 1 ? AppSize.s16 : 0,
              ),
              child: ProductCard(
                product: demoFlashSaleProducts[index],
                press: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
