import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_now/app/extensions.dart';

import '../../../../../app/resources/colors/color_manager.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../../../../../domain/models/product_model.dart';
import '../network_image_with_loader.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.productModel,
    required this.press,
    this.child = const SizedBox(),
  }) : super(key: key);
  final ProductModel productModel;
  final VoidCallback press;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s12),
        border: Border.all(
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1.w,
            child:
                NetworkImageWithLoader(productModel.image, radius: AppSize.s12),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s20, vertical: AppSize.s8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.brandName.toUpperCase(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: AppSize.s8),
                      SizedBox(
                        width: context.width * 0.4,
                        child: Text(
                          productModel.title,
                          maxLines: AppSize.s2.toInt(),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: ColorManager.black),
                        ),
                      ),
                      const Spacer(),
                      productModel.priceAfetDiscount != null
                          ? Row(
                              children: [
                                Text(
                                  "\$${productModel.priceAfetDiscount}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: ColorManager.blue),
                                ),
                                const SizedBox(width: AppSize.s16 / 4),
                                Text(
                                  "\$${productModel.price}",
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color,
                                    fontSize: AppSize.s10,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              "\$${productModel.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: ColorManager.blue),
                            ),
                    ],
                  ),
                  child,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
