import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../app/resources/assets/icon_assets.dart';
import '../../../../../app/resources/colors/color_manager.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../../../widgets/home/Banner/get_banners.dart';
import '../../../widgets/home/flash_sale.dart';
import '../../../widgets/home/offer_carousel_and_categories.dart';
import '../../../widgets/home/popular_products.dart';
import '../../../widgets/home/title_of_items.dart';

class CategoryOfDiscoverScreen extends StatelessWidget {
  const CategoryOfDiscoverScreen({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, categoryName),
      body: const SafeArea(
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

AppBar buildAppBar(BuildContext context, String categoryName) {
  return AppBar(
    // pinned: true,
    // floating: true,
    // snap: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    leading: BackButton(color: ColorManager.grey),
    leadingWidth: 0,
    centerTitle: false,

    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s30),
      child: TitleOfItems(title: categoryName, fontSize: AppSize.s20.sp),
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorManager.darkGrey,
      statusBarBrightness: Brightness.dark,
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          IconAssets.bagFull,
          //  category.svg
          //  dot.svg
          height: 24,
          color: Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
    ],
    elevation: AppSize.s0,
  );
}
