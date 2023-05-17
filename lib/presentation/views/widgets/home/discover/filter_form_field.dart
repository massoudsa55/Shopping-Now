import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../app/resources/assets/icon_assets.dart';
import '../../../../../app/resources/values/app_size.dart';

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
