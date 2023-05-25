import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_now/app/extensions.dart';

import '../../../app/resources/assets/icon_assets.dart';
import '../../../app/app_constants.dart';
import '../../../app/resources/colors/color_manager.dart';
import '../../../app/resources/routes/routes_manager.dart';
import '../../../app/resources/values/app_size.dart';
import 'home/discover/discover_screen.dart';
import 'home/favorite/favorite_screen.dart';
import 'home/home_screen.dart';
import 'home/cart_screen.dart';
import 'home/profile/profile_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  StartScreenState createState() => StartScreenState();
}

class StartScreenState extends State<StartScreen> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const DiscoverScreen(),
    const FavoriteScreen(),
    // EmptyCartScreen(), // if Cart is empty
    const CartScreen(),
    const ProfileScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SvgPicture svgIcon(String src, {Color? color}) {
      return SvgPicture.asset(
        src,
        height: 24.h,
        // colorBlendMode: BlendMode.modulate,
        color: color ??
            Theme.of(context).iconTheme.color!.withOpacity(
                Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
      );
    }

    return Scaffold(
      appBar: buildAppBar(context),
      // body: _pages[_currentIndex],
      body: PageTransitionSwitcher(
        duration: defaultDuration,
        transitionBuilder: (child, animation, secondAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondAnimation,
            child: child,
          );
        },
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: AppSize.s8),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : ColorManager.primary,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index != _currentIndex) {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : const Color(0xFF101015),
          type: BottomNavigationBarType.fixed,
          // selectedLabelStyle: TextStyle(color: primaryColor),
          selectedFontSize: 12.sp,
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: svgIcon(IconAssets.shop),
              activeIcon: svgIcon(IconAssets.shop, color: ColorManager.primary),
              label: "Shop",
            ),
            BottomNavigationBarItem(
              icon: svgIcon(IconAssets.category),
              activeIcon:
                  svgIcon(IconAssets.category, color: ColorManager.primary),
              label: "Discover",
            ),
            BottomNavigationBarItem(
              icon: svgIcon(IconAssets.heart),
              activeIcon:
                  svgIcon(IconAssets.heart, color: ColorManager.primary),
              label: "Favory",
            ),
            BottomNavigationBarItem(
              icon: svgIcon(IconAssets.bag),
              activeIcon: svgIcon(IconAssets.bag, color: ColorManager.primary),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: svgIcon(IconAssets.profile),
              activeIcon:
                  svgIcon(IconAssets.profile, color: ColorManager.primary),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      // pinned: true,
      // floating: true,
      // snap: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: const SizedBox(),
      leadingWidth: 0,
      centerTitle: false,
      title: SvgPicture.asset(
        IconAssets.shoplon,
        color: Theme.of(context).iconTheme.color,
        height: 20.h,
        width: 100.w,
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.pushNamed(AppRoutes.searchScreenRoute);
          },
          icon: SvgPicture.asset(
            IconAssets.search,
            height: 24.h,
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            IconAssets.notification,
            height: 24.h,
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
      ],
      elevation: AppSize.s0,
    );
  }
}
