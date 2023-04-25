import 'package:flutter/material.dart';

import '../../../../app/resources/values/app_size.dart';
import '../../../../domain/models/product_model.dart';
import 'Banner/m/banner_m_with_counter.dart';
import 'product/product_card.dart';

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
        const SizedBox(height: AppSize.s16 / 2),
        Padding(
          padding: const EdgeInsets.all(AppSize.s16),
          child: Text(
            "Flash sale",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Find demoFlashSaleProducts on models/ProductModel.dart
            itemCount: demoFlashSaleProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: AppSize.s16,
                right:
                    index == demoFlashSaleProducts.length - 1 ? AppSize.s16 : 0,
              ),
              child: ProductCard(
                image: demoFlashSaleProducts[index].image,
                brandName: demoFlashSaleProducts[index].brandName,
                title: demoFlashSaleProducts[index].title,
                price: demoFlashSaleProducts[index].price,
                priceAfetDiscount:
                    demoFlashSaleProducts[index].priceAfetDiscount,
                dicountpercent: demoFlashSaleProducts[index].dicountpercent,
                press: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
