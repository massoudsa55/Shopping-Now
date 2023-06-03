import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/app_constants.dart';
import '../../../../../app/extensions.dart';
import '../../../../../app/resources/colors/color_manager.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../../../../../domain/models/product_model.dart';
import '../network_image_with_loader.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  final ProductModel product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final size = Size(context.width / 3, context.height / 3);
    return OutlinedButton(
      onPressed: press,
      onLongPress: () {},
      style: OutlinedButton.styleFrom(
          minimumSize: size,
          maximumSize: size,
          padding: const EdgeInsets.all(AppSize.s8)),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: AppSize.s1_15.sp,
            child: Stack(
              children: [
                NetworkImageWithLoader(product.image, radius: AppSize.s12),
                if (product.dicountpercent != null)
                  Positioned(
                    right: AppSize.s8.w,
                    top: AppSize.s8.h,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppSize.s8),
                      height: AppSize.s16.h,
                      decoration: const BoxDecoration(
                        color: errorColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppSize.s12)),
                      ),
                      child: Center(
                        child: Text(
                          "${product.dicountpercent}% off",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s8, vertical: AppSize.s8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.brandName.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorManager.grey),
                  ),
                  SizedBox(height: AppSize.s8.h),
                  Text(
                    product.title,
                    maxLines: AppSize.s2.toInt(),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: ColorManager.lightPrimary.withOpacity(0.7)),
                  ),
                  const Spacer(),
                  product.priceAfetDiscount != null
                      ? Row(
                          children: [
                            Text(
                              "\$${product.priceAfetDiscount}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: ColorManager.blue),
                            ),
                            SizedBox(width: AppSize.s4.w),
                            Text(
                              "\$${product.price}",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .color,
                                fontSize: AppSize.s10.sp,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          "\$${product.price}",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: ColorManager.blue),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
