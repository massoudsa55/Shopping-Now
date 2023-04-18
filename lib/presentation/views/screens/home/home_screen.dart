import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            /*const SliverToBoxAdapter(child: OffersCarouselAndCategories()),
            const SliverToBoxAdapter(child: PopularProducts()),
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 10 * 1.5),
              sliver: SliverToBoxAdapter(child: FlashSale()),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  BannerSStyle1(
                    title: "New \narrival",
                    subtitle: "SPECIAL OFFER",
                    discountParcent: 50,
                    press: () {},
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  BannerSStyle4(
                    title: "SUMMER \nSALE",
                    subtitle: "SPECIAL OFFER",
                    bottomText: "UP TO 80% OFF",
                    press: () {},
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  BannerSStyle4(
                    image: "https://i.imgur.com/dBrsD0M.png",
                    title: "Black \nfriday",
                    subtitle: "50% off",
                    bottomText: "Collection".toUpperCase(),
                    press: () {},
                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
