import 'package:flutter/material.dart';

import '../../widgets/home/Banner/get_banners.dart';
import '../../widgets/home/flash_sale.dart';
import '../../widgets/home/offer_carousel_and_categories.dart';
import '../../widgets/home/popular_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: OffersCarouselAndCategories()),
            SliverToBoxAdapter(child: PopularProducts()),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 10 * 1.5),
              sliver: SliverToBoxAdapter(child: FlashSale()),
            ),
            SliverToBoxAdapter(child: GetBanners()),
          ],
        ),
      ),
    );
  }
}
