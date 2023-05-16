import 'package:flutter/material.dart';

import '../../../../app/resources/routes/routes_manager.dart';
import '../../../../app/resources/values/app_size.dart';
import '../../widgets/home/product/secondary_order_card.dart';
import '../../widgets/home/review_all_orders.dart';
import '../../widgets/main_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: ReviewAllOrders()),
            const SliverToBoxAdapter(
                child: OrderSummary(
              title: "Order Summary",
              children: [
                RowOfOrderSummary(title: "Subtotal", value: "\$169"),
                SizedBox(height: AppSize.s8),
                RowOfOrderSummary(
                    title: "ShippingFree", value: "Free", isNotHasPris: true),
                SizedBox(height: AppSize.s8),
                RowOfOrderSummary(title: "Discount", value: "\$10"),
                SizedBox(height: AppSize.s8),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSize.s4),
                  child: Divider(
                    thickness: AppSize.s1_5,
                  ),
                ),
                RowOfOrderSummary(
                    title: "Total(Include of VAT)", value: "\$185"),
                SizedBox(height: AppSize.s8),
                RowOfOrderSummary(title: "Estimated Vat", value: "\$5"),
                SizedBox(height: AppSize.s8),
              ],
            )),
            SliverPadding(
              padding: const EdgeInsets.all(AppSize.s20),
              sliver: SliverToBoxAdapter(
                  child: MainButton(
                text: "Continue",
                press: () {
                  Navigator.of(context).pushNamed(AppRoutes.paymentScreenRoute);
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
