import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              ImageAssets.loginLogo,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(AppSize.s20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back!",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: AppSize.s10),
                  const Text(
                    "Log in with your data that you intered during your registration.",
                  ),
                  const SizedBox(height: AppSize.s20),
                  LogInForm(formKey: _formKey),
                  Align(
                    child: TextButton(
                      child: const Text("Forgot password"),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: size.height > 700 ? size.height * 0.1 : AppSize.s20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigator.pushNamedAndRemoveUntil(context, entryPointScreenRoute,ModalRoute.withName(logInScreenRoute));
                      }
                    },
                    child: const Text("Log in"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {},
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
