import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../app/extensions.dart';
import '../../../../../app/resources/routes/routes_manager.dart';
import '../../../widgets/main_button.dart';
import '../../../../../app/resources/assets/image_assets.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../../../widgets/auth/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      "Welcome back!",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  const SizedBox(height: AppSize.s10),
                  FadeInDown(
                    duration: const Duration(milliseconds: 800),
                    child: const Text(
                      "Log in with your data that you intered during your registration.",
                    ),
                  ),
                  const SizedBox(height: AppSize.s20),
                  FadeInDown(child: LogInForm(formKey: _formKey)),
                  FadeIn(
                    child: Align(
                      child: TextButton(
                        child: const Text("Forgot password"),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.height > 700
                        ? context.height * 0.08
                        : AppSize.s20,
                  ),
                  MainButton(
                    text: "Log in",
                    press: () async {
                      if (_formKey.currentState!.validate()) {
                        // Navigator.pushNamedAndRemoveUntil(context, entryPointScreenRoute,ModalRoute.withName(logInScreenRoute));
                        /*await _auth
                .createUserWithEmailAndPassword(
                    email: "massoudsa55@gmail.com",
                    password: "password")
                .then((value) => print(value));*/
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const StartScreen()));
                        context.pushNamedAndRemoveUntil(
                            AppRoutes.startScreenRoute);
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          context.pushReplacementNamed(
                              AppRoutes.registerScreenRoute);
                        },
                        child: const Text("Sign up"),
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
