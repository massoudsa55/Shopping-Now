import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/resources/colors/color_manager.dart';
import '../../../../app/resources/values/app_size.dart';

// For preview
class CategoryModel {
  final String name;
  final String? svgSrc, route;

  CategoryModel({
    required this.name,
    this.svgSrc,
    this.route,
  });
}

List<CategoryModel> demoCategories = [
  CategoryModel(name: "All Categories"),
  CategoryModel(
    name: "On Sale",
    svgSrc: "assets/icons/sale.svg",
    /*route: onSaleScreenRoute*/
  ),
  CategoryModel(name: "Man's", svgSrc: "assets/icons/man.svg"),
  CategoryModel(name: "Woman’s", svgSrc: "assets/icons/woman.svg"),
  CategoryModel(
    name: "Kids",
    svgSrc: "assets/icons/child.svg", /*route: kidsScreenRoute*/
  ),
];
// End For Preview

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            demoCategories.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                  left: index == 0 ? AppSize.s16 : AppSize.s8,
                  right: index == demoCategories.length - 1
                      ? AppSize.s16
                      : AppSize.s0),
              child: CategoryBtn(
                category: demoCategories[index].name,
                svgSrc: demoCategories[index].svgSrc,
                isActive: index == 0,
                press: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({
    Key? key,
    required this.category,
    this.svgSrc,
    required this.isActive,
    required this.press,
  }) : super(key: key);

  final String category;
  final String? svgSrc;
  final bool isActive;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s30)),
      child: Container(
        height: 35.h,
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
        decoration: BoxDecoration(
          color: isActive ? ColorManager.primary : Colors.transparent,
          border: Border.all(
              color: isActive
                  ? Colors.transparent
                  : Theme.of(context).dividerColor),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s30)),
        ),
        child: Row(
          children: [
            if (svgSrc != null)
              SvgPicture.asset(
                svgSrc!,
                height: 20.h,
                color:
                    isActive ? Colors.white : Theme.of(context).iconTheme.color,
              ),
            if (svgSrc != null) const SizedBox(width: AppSize.s12),
            Text(
              category,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: isActive
                      ? Colors.white
                      : Theme.of(context).textTheme.bodyText1!.color),
            ),
          ],
        ),
      ),
    );
  }
}
