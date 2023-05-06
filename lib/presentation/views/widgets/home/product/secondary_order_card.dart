import 'package:flutter/material.dart';

import '../../../../../app/resources/colors/color_manager.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../title_of_items.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

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
              title: "Order Summary",
              fontSize: AppSize.s18,
              fontColor: ColorManager.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const RowOfOrderSummary(title: "Subtotal", value: "\$169"),
          const SizedBox(height: AppSize.s8),
          const RowOfOrderSummary(
              title: "ShippingFree", value: "Free", isNotHasPris: true),
          const SizedBox(height: AppSize.s8),
          const RowOfOrderSummary(title: "Discount", value: "\$10"),
          const SizedBox(height: AppSize.s8),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.s4),
            child: Divider(
              thickness: AppSize.s1_5,
            ),
          ),
          const RowOfOrderSummary(
              title: "Total(Include of VAT)", value: "\$185"),
          const SizedBox(height: AppSize.s8),
          const RowOfOrderSummary(title: "Estimated Vat", value: "\$5"),
          const SizedBox(height: AppSize.s8),
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
