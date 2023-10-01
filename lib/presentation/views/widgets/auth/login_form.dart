import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/app_constants.dart';
import '../../../../app/resources/assets/icon_assets.dart';
import '../../../../app/resources/values/app_size.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (emal) {
              // Email
            },
            validator: emaildValidator,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email address",
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSize.s16),
                child: SvgPicture.asset(
                  IconAssets.loginMessage,
                  height: 22.h,
                  width: 22.w,
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!
                      .withOpacity(0.3),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSize.s20),
          TextFormField(
            onSaved: (pass) {
              // Password
            },
            validator: passwordValidator,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSize.s16),
                child: SvgPicture.asset(
                  IconAssets.loginLock,
                  height: 22.h,
                  width: 22.w,
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!
                      .withOpacity(0.3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
