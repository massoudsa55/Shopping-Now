import 'package:flutter/material.dart';

import '../../widgets/home/review_all_orders.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: ReviewAllOrders()),
            // SliverToBoxAdapter(child: PopularProducts()),
            // SliverPadding(
            //   padding: EdgeInsets.symmetric(vertical: 10 * 1.5),
            //   sliver: SliverToBoxAdapter(child: FlashSale()),
            // ),
            // SliverToBoxAdapter(child: GetBanners()),
          ],
        ),
      ),
    );
  }
}
