import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../app/resources/assets/icon_assets.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../../../widgets/home/discover/filter_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const SafeArea(
        child: Column(
          children: [
            FilterFormField(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      // pinned: true,
      // floating: true,
      // snap: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: const SizedBox(),
      leadingWidth: 0,
      centerTitle: false,
      title: SvgPicture.asset(
        IconAssets.shoplon,
        color: Theme.of(context).iconTheme.color,
        height: 20.h,
        width: 100.w,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              IconAssets.close,
              height: 24.h,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
        ),
      ],
      elevation: AppSize.s0,
    );
  }
}
