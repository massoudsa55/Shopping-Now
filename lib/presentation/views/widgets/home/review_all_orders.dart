import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/resources/values/app_size.dart';
import '../../../../domain/models/order_model.dart';
import 'product/order_product.dart';
import 'title_of_items.dart';

class ReviewAllOrders extends StatelessWidget {
  const ReviewAllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(AppSize.s16),
          child: TitleOfItems(
            title: "Review your order",
            fontSize: AppSize.s18,
          ),
        ),
        SizedBox(
          height: 250.h,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: demoListOrders.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSize.s8,
                horizontal: AppSize.s20,
              ),
              child: OrderCard(
                image: demoListOrders[index].product.image,
                brandName: demoListOrders[index].product.brandName,
                title: demoListOrders[index].product.title,
                price: demoListOrders[index].product.price,
                priceAfetDiscount:
                    demoListOrders[index].product.priceAfetDiscount,
                dicountpercent: demoListOrders[index].product.dicountpercent,
                press: () {},
              ),
            ),
          ),
        )
      ],
    );
  }
}
