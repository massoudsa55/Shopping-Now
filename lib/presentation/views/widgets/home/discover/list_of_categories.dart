import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../app/resources/assets/icon_assets.dart';
import '../../../../../app/resources/colors/color_manager.dart';
import '../../../../../app/resources/values/app_size.dart';

class ListOfCategories extends StatefulWidget {
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
  State<ListOfCategories> createState() => _ListOfCategoriesState();
}

class _ListOfCategoriesState extends State<ListOfCategories> {
  late bool isExpansionChanged;
  @override
  void initState() {
    isExpansionChanged = false;
    super.initState();
  }

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
            leading: widget.leading,
            title: Text(
              widget.title,
              style: TextStyle(
                  color: isExpansionChanged
                      ? ColorManager.primary
                      : ColorManager.grey),
            ),
          ),
          trailing: SvgPicture.asset(
            isExpansionChanged ? IconAssets.arrowTop : IconAssets.arrowDown,
            color:
                isExpansionChanged ? ColorManager.primary : ColorManager.black,
            width: 25.w,
          ),
          initiallyExpanded: isExpansionChanged,
          onExpansionChanged: (value) {
            setState(() {
              isExpansionChanged = value;
            });
          },
          children: widget.children,
        ),
      ),
    );
  }
}
