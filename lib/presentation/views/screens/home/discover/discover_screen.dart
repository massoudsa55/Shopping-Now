import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../app/resources/assets/icon_assets.dart';
import '../../../../../app/resources/colors/color_manager.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../../../widgets/home/title_of_items.dart';

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
                        listOgCategories(title: "All clothing", onTap: () {}),
                        listOgCategories(title: "New In", onTap: () {}),
                        listOgCategories(
                            title: "Coats & jackets", onTap: () {}),
                        listOgCategories(title: "Dresses", onTap: () {}),
                        listOgCategories(title: "Jeans", onTap: () {}),
                      ],
                    ),
                    ListOfCategories(
                      title: "Man's & Woman's",
                      leading: SvgPicture.asset(IconAssets.manAndWoman),
                      children: [
                        listOgCategories(title: "All clothing", onTap: () {}),
                        listOgCategories(title: "New In", onTap: () {}),
                        listOgCategories(
                            title: "Coats & jackets", onTap: () {}),
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
                        listOgCategories(title: "All clothing", onTap: () {}),
                        listOgCategories(title: "New In", onTap: () {}),
                        listOgCategories(
                            title: "Coats & jackets", onTap: () {}),
                      ],
                    ),
                    ListOfCategories(
                      title: "Accessoires",
                      leading: SvgPicture.asset(IconAssets.man),
                      children: [
                        listOgCategories(title: "All clothing", onTap: () {}),
                        listOgCategories(title: "New In", onTap: () {}),
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

  Padding listOgCategories(
      {required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSize.s30 * 2),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const Divider(thickness: AppSize.s1_5),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}

class ListOfCategories extends StatelessWidget {
  const ListOfCategories({
    Key? key,
    required this.title,
    this.leading = const Icon(Icons.abc),
    this.children = const [],
  }) : super(key: key);

  final String title;
  final Widget leading;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.s8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
          border: Border.all(width: 0.05),
        ),
        child: ExpansionTile(
          title: ListTile(
            leading: leading,
            title: Text(title),
          ),
          trailing: SvgPicture.asset(IconAssets.arrowDown),
          // TODO: emplement this later
          onExpansionChanged: (value) {},
          children: children,
        ),
      ),
    );
  }
}

class FilterFormField extends StatelessWidget {
  const FilterFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
      child: TextFormField(
        onSaved: (filter) {
          // Filter
        },
        // validator: emaildValidator,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: "Find something ...",
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSize.s20 * 0.75),
            child: SvgPicture.asset(
              IconAssets.search,
              height: 22.sp,
              width: 22.sp,
              color: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .color!
                  .withOpacity(0.3),
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSize.s20 * 0.75),
            child: InkWell(
              onTap: () {},
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppSize.s12)),
              child: SvgPicture.asset(
                IconAssets.filter,
                height: 22.sp,
                width: 22.sp,
                // color: Theme.of(context).textTheme.bodyText1!.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
