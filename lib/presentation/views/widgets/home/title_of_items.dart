import 'package:flutter/material.dart';

import '../../../../app/resources/colors/color_manager.dart';
import '../../../../app/resources/values/app_size.dart';

class TitleOfItems extends StatelessWidget {
  const TitleOfItems({
    Key? key,
    required this.title,
    this.fontSize = AppSize.s12,
    this.fontColor = Colors.grey,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);
  final String title;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: fontColor == Colors.grey ? ColorManager.grey : fontColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
    );
  }
}
