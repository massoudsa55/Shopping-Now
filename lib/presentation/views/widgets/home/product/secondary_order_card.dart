import 'package:flutter/material.dart';

import '../../../../../app/resources/colors/color_manager.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../title_of_items.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 160.h,
      padding: const EdgeInsets.all(AppSize.s16),
      margin: const EdgeInsets.all(AppSize.s20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
        border: Border.all(
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppSize.s16),
            child: TitleOfItems(
              title: title,
              fontSize: AppSize.s18,
              fontColor: ColorManager.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

class RowOfOrderSummary extends StatelessWidget {
  const RowOfOrderSummary({
    Key? key,
    required this.title,
    required this.value,
    this.isNotHasPris = false,
  }) : super(key: key);
  final String title;
  final String value;
  final bool isNotHasPris;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleOfItems(
          title: title,
          fontWeight: FontWeight.w700,
        ),
        TitleOfItems(
          title: value,
          fontColor: isNotHasPris ? ColorManager.green : ColorManager.black,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
