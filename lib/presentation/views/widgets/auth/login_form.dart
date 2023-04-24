import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            // TODO: implement this
            // validator: emaildValidator,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email address",
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: AppSize.s20 * 0.75),
                child: SvgPicture.asset(
                  IconAssets.loginMessage,
                  height: 24,
                  width: 24,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
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
            // TODO: implement this
            // validator: passwordValidator,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: AppSize.s20 * 0.75),
                child: SvgPicture.asset(
                  IconAssets.loginLock,
                  height: 24,
                  width: 24,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
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
