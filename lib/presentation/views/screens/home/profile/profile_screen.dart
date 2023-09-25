import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_now/presentation/views/widgets/home/network_image_with_loader.dart';

import '../../../../../app/resources/assets/image_assets.dart';
import '../../../../../app/resources/colors/color_manager.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../../../../../domain/models/profile_model.dart';
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
              ListTile(
                leading: CircleAvatar(
                    child: NetworkImageWithLoader(demoProfileModel.urlPicture)),
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
              const SizedBox(height: AppSize.s16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: AppSize.s20),
                height: 150.h,
                decoration: const BoxDecoration(
                    color: ColorManager.colorB58D67,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSize.s12))),
                child: SvgPicture.asset(ImageAssets.onBoardingLogo1),
              ),
              const CustomListProfil(
                title: "Acount",
                childern: [
                  ListAcountGlobal(
                      leading: Icons.list_alt_rounded, title: "Orders"),
                  ListAcountGlobal(
                      leading: Icons.list_alt_rounded, title: "Returns"),
                  ListAcountGlobal(
                      leading: Icons.list_alt_rounded, title: "Wishlist"),
                  ListAcountGlobal(
                      leading: Icons.list_alt_rounded, title: "Address"),
                  ListAcountGlobal(
                      leading: Icons.list_alt_rounded, title: "Payment"),
                  ListAcountGlobal(
                      leading: Icons.list_alt_rounded, title: "Wallte"),
                ],
              ),
              const CustomListProfil(
                title: "Personalistation",
                childern: [
                  ListAcountGlobal(
                      leading: Icons.list_alt_rounded, title: "Notification"),
                  ListAcountGlobal(
                      leading: Icons.list_alt_rounded, title: "Preferences"),
                ],
              ),
              const CustomListProfil(
                title: "Settings",
                childern: [
                  ListAcountGlobal(leading: Icons.translate, title: "Language"),
                  ListAcountGlobal(
                      leading: Icons.location_on_outlined, title: "Location"),
                ],
              ),
              const CustomListProfil(
                title: "Help & Support",
                childern: [
                  ListAcountGlobal(
                      leading: Icons.headphones, title: "Get Help"),
                  ListAcountGlobal(leading: Icons.help_outline, title: "FAQ"),
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
  });
  final String title;
  final IconData leading;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(leading),
          title: Text(title, style: Theme.of(context).textTheme.titleLarge),
          trailing: const Icon(Icons.arrow_forward_ios, size: AppSize.s18),
        ),
        const Divider(height: AppSize.s3),
      ],
    );
  }
}
