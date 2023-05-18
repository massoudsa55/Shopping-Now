import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/app_constants.dart';

class ChatActiveDot extends StatelessWidget {
  const ChatActiveDot({
    Key? key,
    this.dotColor = successColor,
  }) : super(key: key);
  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      width: 12.w,
      decoration: BoxDecoration(
        color: dotColor,
        shape: BoxShape.circle,
        border: Border.all(
          width: 3,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
