import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../app/resources/assets/image_assets.dart';
import '../../../../../app/resources/colors/color_manager.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../../../../../domain/models/profile_model.dart';
import '../../../widgets/home/network_image_with_loader.dart';
import '../../../widgets/home/title_of_items.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title of his name, email and picture
              InkWell(
                onTap: () {},
                child: ListTile(
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
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              const SizedBox(height: AppSize.s16),
              // this card for upgrade to pro
              Container(
                margin: const EdgeInsets.symmetric(horizontal: AppSize.s20),
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
                height: 150.h,
                decoration: BoxDecoration(
                    color: ColorManager.cardBgColor.withOpacity(0.4),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.s12))),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    SvgPicture.asset(ImageAssets.onBoardingLogo1),
                    // Container(
                    //   color: ColorManager.black.withOpacity(0.3)
                    // ),
                    Positioned(
                        bottom: 120,
                        child: Text(
                          "Start Plan",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: ColorManager.green),
                        )),
                    Positioned(
                      bottom: 100,
                      child: Text(
                        "All features unlocked!",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: ColorManager.white,
                        ),
                        child: const Text(
                          "Upgrade",
                          style: TextStyle(
                              color: ColorManager.green,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomListProfil(
                title: "Acount",
                childern: [
                  ListAcountGlobal(
                    leading: Icons.list_alt_rounded,
                    title: "Orders",
                    onTap: () {},
                  ),
                  ListAcountGlobal(
                    leading: Icons.list_alt_rounded,
                    title: "Returns",
                    onTap: () {},
                  ),
                  ListAcountGlobal(
                    leading: Icons.list_alt_rounded,
                    title: "Wishlist",
                    onTap: () {},
                  ),
                  ListAcountGlobal(
                    leading: Icons.list_alt_rounded,
                    title: "Address",
                    onTap: () {},
                  ),
                  ListAcountGlobal(
                    leading: Icons.list_alt_rounded,
                    title: "Payment",
                    onTap: () {},
                  ),
                  ListAcountGlobal(
                    leading: Icons.list_alt_rounded,
                    title: "Wallte",
                    onTap: () {},
                  ),
                ],
              ),
              CustomListProfil(
                title: "Personalistation",
                childern: [
                  ListAcountGlobal(
                    leading: Icons.list_alt_rounded,
                    title: "Notification",
                    onTap: () {},
                  ),
                  ListAcountGlobal(
                    leading: Icons.list_alt_rounded,
                    title: "Preferences",
                    onTap: () {},
                  ),
                ],
              ),
              CustomListProfil(
                title: "Settings",
                childern: [
                  ListAcountGlobal(
                    leading: Icons.translate,
                    title: "Language",
                    onTap: () {},
                  ),
                  ListAcountGlobal(
                    leading: Icons.location_on_outlined,
                    title: "Location",
                    onTap: () {},
                  ),
                ],
              ),
              CustomListProfil(
                title: "Help & Support",
                childern: [
                  ListAcountGlobal(
                    leading: Icons.headphones,
                    title: "Get Help",
                    onTap: () {},
                  ),
                  ListAcountGlobal(
                    leading: Icons.help_outline,
                    title: "FAQ",
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListProfil extends StatelessWidget {
  const CustomListProfil(
      {super.key, required this.title, required this.childern});
  final String title;
  final List<Widget> childern;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSize.s20, vertical: AppSize.s10),
          child: TitleOfItems(title: title, fontSize: AppSize.s18.sp),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
          child: Column(
            children: childern,
          ),
        ),
      ],
    );
  }
}

class ListAcountGlobal extends StatelessWidget {
  const ListAcountGlobal({
    super.key,
    required this.title,
    required this.leading,
    required this.onTap,
  });

  final String title;
  final IconData leading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            leading: Icon(leading),
            title: Text(title, style: Theme.of(context).textTheme.titleLarge),
            trailing: const Icon(Icons.arrow_forward_ios, size: AppSize.s18),
          ),
          const Divider(height: AppSize.s3),
        ],
      ),
    );
  }
}
