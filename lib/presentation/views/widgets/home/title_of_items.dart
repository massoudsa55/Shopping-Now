import 'package:flutter/material.dart';

import '../../../../app/resources/colors/color_manager.dart';
import '../../../../app/resources/values/app_size.dart';

class TitleOfItems extends StatelessWidget {
  const TitleOfItems({
    Key? key,
    required this.title,
    this.fontSize = AppSize.s12,
  }) : super(key: key);
  final String title;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: ColorManager.grey,
            fontSize: fontSize,
          ),
    );
  }
}
