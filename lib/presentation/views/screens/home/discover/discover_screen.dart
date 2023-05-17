import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_now/app/extensions.dart';

import '../../../../../app/resources/assets/icon_assets.dart';
import '../../../../../app/resources/colors/color_manager.dart';
import '../../../../../app/resources/routes/routes_manager.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../../../widgets/home/title_of_items.dart';
import '../../../widgets/home/discover/list_of_categories.dart';
import '../../../widgets/home/discover/filter_form_field.dart';
import 'category_of_discover.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSize.s20, vertical: AppSize.s20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FilterFormField(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSize.s20),
                child: TitleOfItems(
                  title: "Categories",
                  fontColor: ColorManager.black,
                  fontSize: AppSize.s20,
                ),
              ),
              Flexible(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListOfCategories(
                      title: "On Sale",
                      leading: SvgPicture.asset(
                        IconAssets.onSale,
                        width: 15.w,
                        height: 15.h,
                      ),
                      children: [
                        childOfCategoryList(
                            title: "All clothing",
                            onTap: () {
                              context.push(const CategoryOfDiscoverScreen(
                                  categoryName: "On Sale"));
                            }),
                        childOfCategoryList(
                            title: "New In",
                            onTap: () {
                              context.push(const CategoryOfDiscoverScreen(
                                  categoryName: "On Sale"));
                            }),
                        childOfCategoryList(
                            title: "Coats & jackets",
                            onTap: () {
                              context.push(const CategoryOfDiscoverScreen(
                                  categoryName: "On Sale"));
                            }),
                        childOfCategoryList(
                            title: "Dresses",
                            onTap: () {
                              context.push(const CategoryOfDiscoverScreen(
                                  categoryName: "On Sale"));
                            }),
                        childOfCategoryList(
                            title: "Jeans",
                            onTap: () {
                              context.push(const CategoryOfDiscoverScreen(
                                  categoryName: "On Sale"));
                            }),
                      ],
                    ),
                    ListOfCategories(
                      title: "Man's & Woman's",
                      leading: SvgPicture.asset(IconAssets.manAndWoman),
                      children: [
                        childOfCategoryList(
                            title: "All clothing",
                            onTap: () {
                              context.push(const CategoryOfDiscoverScreen(
                                  categoryName: "Man's & Woman's"));
                            }),
                        childOfCategoryList(
                            title: "New In",
                            onTap: () {
                              context.push(const CategoryOfDiscoverScreen(
                                  categoryName: "Man's & Woman's"));
                            }),
                        childOfCategoryList(
                            title: "Coats & jackets",
                            onTap: () {
                              context.push(const CategoryOfDiscoverScreen(
                                  categoryName: "Man's & Woman's"));
                            }),
                      ],
                    ),
                    ListOfCategories(
                      title: "Kid's",
                      leading: SvgPicture.asset(
                        IconAssets.kids,
                        width: 20.w,
                        height: 20.h,
                      ),
                      children: [
                        childOfCategoryList(
                            title: "All clothing",
                            onTap: () {
                              context.push(const CategoryOfDiscoverScreen(
                                  categoryName: "Kid's"));
                            }),
                        childOfCategoryList(
                            title: "New In",
                            onTap: () {
                              context.push(const CategoryOfDiscoverScreen(
                                  categoryName: "Kid's"));
                            }),
                        childOfCategoryList(
                            title: "Coats & jackets",
                            onTap: () {
                              context.push(const CategoryOfDiscoverScreen(
                                  categoryName: "Kid's"));
                            }),
                      ],
                    ),
                    ListOfCategories(
                      title: "Accessoires",
                      leading: SvgPicture.asset(IconAssets.man),
                      children: [
                        childOfCategoryList(
                            title: "All clothing",
                            onTap: () {
                              context.push(const CategoryOfDiscoverScreen(
                                  categoryName: "Accessoires"));
                            }),
                        childOfCategoryList(
                            title: "New In",
                            onTap: () {
                              context.push(const CategoryOfDiscoverScreen(
                                  categoryName: "Accessoires"));
                            }),
                      ],
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Padding childOfCategoryList(
      {required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSize.s30 * 2),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const Divider(thickness: AppSize.s1_15),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
