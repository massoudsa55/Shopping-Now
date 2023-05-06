import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/resources/colors/color_manager.dart';
import '../../../../app/resources/values/app_size.dart';
import '../../widgets/home/product/secondary_order_card.dart';
import '../../widgets/home/review_all_orders.dart';
import '../../widgets/home/title_of_items.dart';
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
            const SliverToBoxAdapter(child: OrderSummary()),
            SliverPadding(
              padding: const EdgeInsets.all(AppSize.s20),
              sliver: SliverToBoxAdapter(
                  child: MainButton(
                text: "Continue",
                press: () {},
              )),
            ),
          ],
        ),
      ),
    );
  }
}
