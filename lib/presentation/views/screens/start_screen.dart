import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/app_constants.dart';
import '../../../app/resources/colors/color_manager.dart';
import '../../../app/resources/values/app_size.dart';
import 'home/home_screen.dart';
import 'home/cart_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  StartScreenState createState() => StartScreenState();
}

class StartScreenState extends State<StartScreen> {
  final List _pages = [
    const HomeScreen(),
    Container(),
    // DiscoverScreen(),
    Container(),
    // BookmarkScreen(),
    //Container(),
    // EmptyCartScreen(), // if Cart is empty
    const CartScreen(),
    Container(),
    // ProfileScreen(),
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
      appBar: AppBar(
        // pinned: true,
        // floating: true,
        // snap: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const SizedBox(),
        leadingWidth: 0,
        centerTitle: false,
        title: SvgPicture.asset(
          "assets/icons/shoplon.svg",
          color: Theme.of(context).iconTheme.color,
          height: 20,
          width: 100,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              height: 24,
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/notification.svg",
              height: 24,
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        ],
        elevation: AppSize.s0,
      ),
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
          selectedFontSize: 12,
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/shop.svg"),
              activeIcon:
                  svgIcon("assets/icons/shop.svg", color: ColorManager.primary),
              label: "Shop",
            ),
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/category.svg"),
              activeIcon: svgIcon("assets/icons/category.svg",
                  color: ColorManager.primary),
              label: "Discover",
            ),
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/heart.svg"),
              activeIcon: svgIcon("assets/icons/heart.svg",
                  color: ColorManager.primary),
              label: "Favory",
            ),
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/bag.svg"),
              activeIcon:
                  svgIcon("assets/icons/bag.svg", color: ColorManager.primary),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/profile.svg"),
              activeIcon: svgIcon("assets/icons/profile.svg",
                  color: ColorManager.primary),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
