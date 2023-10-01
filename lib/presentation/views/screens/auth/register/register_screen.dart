import 'package:animate_do/animate_do.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_now/app/extensions.dart';

import '../../../../../app/resources/colors/color_manager.dart';
import '../../../../../app/resources/routes/routes_manager.dart';
import '../../../widgets/main_button.dart';
import '../../../../../app/resources/assets/image_assets.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../../../widgets/auth/login_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInDown(
              duration: const Duration(milliseconds: 1500),
              child: SizedBox(
                height: 300.h,
                child: SvgPicture.asset(
                  ImageAssets.loginLogo,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSize.s20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInDown(
                    duration: const Duration(milliseconds: 800),
                    child: Text(
                      "Let's get started!",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(height: AppSize.s10),
                  FadeInDown(
                    duration: const Duration(milliseconds: 800),
                    child: const Text(
                      "Please enter your valid data in order to create an acount.",
                    ),
                  ),
                  const SizedBox(height: AppSize.s20),
                  FadeInDown(child: LogInForm(formKey: _formKey)),
                  FadeIn(
                    child: Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                          activeColor: ColorManager.green,
                        ),
                        const Text("I agree with the"),
                        TextButton(
                          child: const Text("Terms of services"),
                          onPressed: () {},
                        ),
                        const Text("& privacy policy."),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.height > 700
                        ? context.height * 0.08
                        : AppSize.s20,
                  ),
                  MainButton(
                    text: "Continue",
                    press: () async {
                      if (_formKey.currentState!.validate()) {
                        context.pushNamedAndRemoveUntil(
                            AppRoutes.startScreenRoute);
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Do you have an account?"),
                      TextButton(
                        onPressed: () {
                          context
                              .pushReplacementNamed(AppRoutes.loginScreenRoute);
                        },
                        child: const Text("Sign in"),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
