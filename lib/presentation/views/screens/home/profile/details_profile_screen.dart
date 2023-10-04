import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_now/app/extensions.dart';

import '../../../../../app/resources/colors/color_manager.dart';
import '../../../../../app/resources/routes/routes_manager.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../../../../../domain/models/profile_model.dart';
import '../../../widgets/home/network_image_with_loader.dart';

class DetailsProfile extends StatelessWidget {
  const DetailsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: buildAppBar(context),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                      child:
                          NetworkImageWithLoader(demoProfileModel.urlPicture)),
                  title: Text(
                    demoProfileModel.fullNam,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: AppSize.s18.sp),
                  ),
                  subtitle: Text(demoProfileModel.email),
                ),
                const SizedBox(height: AppSize.s40),
                const ProfileInformation(
                    title: "FullName", body: "Messaoud Benkouider"),
                const ProfileInformation(
                    title: "Date of birth", body: "25/05/1993"),
                const ProfileInformation(
                    title: "Phone number", body: "+213795398686"),
                const ProfileInformation(title: "Gender", body: "Male"),
                const ProfileInformation(
                    title: "Email", body: "massoudsa55@gmail.com"),
                ProfileInformation(
                  title: "Password",
                  body: "Change password",
                  isPassword: true,
                  onTap: () {},
                ),
              ],
            ),
          )),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: const BackButton(color: ColorManager.black),
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Profile",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppSize.s16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                context.pushNamed(AppRoutes.detailsProfileRoute);
              },
              child: Text(
                "Edit",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorManager.blue),
              ),
            ),
          ),
        )
      ],
      elevation: AppSize.s0,
    );
  }
}

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    super.key,
    required this.title,
    required this.body,
    this.isPassword = false,
    this.onTap,
  });
  final String title, body;
  final bool isPassword;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              isPassword
                  ? InkWell(
                      onTap: onTap,
                      child: Text(
                        body,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: ColorManager.blue),
                      ),
                    )
                  : Text(
                      body,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
            ],
          ),
        ),
        if (!isPassword)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.s14),
            child: Divider(),
          ),
      ],
    );
  }
}
