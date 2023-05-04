import 'package:flutter/material.dart';

import '../../../../../app/app_constants.dart';
import '../../../../../app/resources/colors/color_manager.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../network_image_with_loader.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfetDiscount,
    this.dicountpercent,
    required this.press,
  }) : super(key: key);
  final String image, brandName, title;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    Size size = Size(mediaQuery.size.width / 3, mediaQuery.size.height / 3);
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
          minimumSize: size,
          maximumSize: size,
          padding: const EdgeInsets.all(AppSize.s8)),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: AppSize.s1_15,
            child: Stack(
              children: [
                NetworkImageWithLoader(image, radius: AppSize.s12),
                if (dicountpercent != null)
                  Positioned(
                    right: AppSize.s8,
                    top: AppSize.s8,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppSize.s8),
                      height: AppSize.s16,
                      decoration: const BoxDecoration(
                        color: errorColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppSize.s12)),
                      ),
                      child: Center(
                        child: Text(
                          "$dicountpercent% off",
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
                    brandName.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorManager.grey),
                  ),
                  const SizedBox(height: AppSize.s8),
                  Text(
                    title,
                    maxLines: AppSize.s2.toInt(),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: ColorManager.lightPrimary.withOpacity(0.7)),
                  ),
                  const Spacer(),
                  priceAfetDiscount != null
                      ? Row(
                          children: [
                            Text(
                              "\$$priceAfetDiscount",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: ColorManager.blue),
                            ),
                            const SizedBox(width: AppSize.s16 / 4),
                            Text(
                              "\$$price",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .color,
                                fontSize: AppSize.s10,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          "\$$price",
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
