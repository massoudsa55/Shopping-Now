import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/resources/colors/color_manager.dart';
import '../../../../app/resources/values/app_size.dart';
import '../../widgets/home/product/secondary_order_card.dart';
import '../../widgets/home/title_of_items.dart';
import '../../widgets/main_button.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // pinned: true,
        // floating: true,
        // snap: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: BackButton(color: ColorManager.grey),
        leadingWidth: 0,
        centerTitle: false,

        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s30),
          child: TitleOfItems(title: "Order", fontSize: AppSize.s20.sp),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.darkGrey,
          statusBarBrightness: Brightness.dark,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/category.svg",
              //  category.svg
              //  dot.svg
              height: 24,
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        ],
        elevation: AppSize.s0,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: size.height * 0.45,
                child: SvgPicture.asset("assets/icons/payment_success.svg"),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
              sliver: SliverToBoxAdapter(
                child: TitleOfItems(
                  title: "Thank you for your order",
                  fontSize: AppSize.s18.sp,
                  fontWeight: FontWeight.bold,
                  fontColor: ColorManager.black,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s20,
                vertical: AppSize.s16,
              ),
              sliver: SliverToBoxAdapter(
                  child: SizedBox(
                      width: double.infinity,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "You'll receive an email at ",
                              style: TextStyle(
                                fontSize: AppSize.s12.sp,
                              ),
                            ),
                            TextSpan(
                              text: "your.mail@gmail.com",
                              style: TextStyle(
                                fontSize: AppSize.s12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " once your order is confirmed.",
                              style: TextStyle(
                                fontSize: AppSize.s12.sp,
                              ),
                            ),
                          ],
                        ),
                      ))),
            ),
            const SliverToBoxAdapter(
                child: OrderSummary(
              title: "Order summary",
              children: [
                RowOfOrderSummary(title: "Order number", value: "#ERD5202326"),
                SizedBox(height: AppSize.s10),
                RowOfOrderSummary(
                    title: "Amount paid",
                    value: "\$476.98",
                    isNotHasPris: true),
                SizedBox(height: AppSize.s10),
              ],
            )),
            SliverPadding(
              padding: const EdgeInsets.all(AppSize.s20),
              sliver: SliverToBoxAdapter(
                  child: Stack(
                alignment: Alignment.center,
                children: [
                  MainButton(
                    text: "Track order",
                    press: () {
                      // Navigator.of(context).pushNamed(AppRoutes.paymentScreenRoute);
                    },
                  ),
                  Positioned(
                    left: 90.w,
                    child: SizedBox(
                      height: 16.h,
                      width: 16.w,
                      child: SvgPicture.asset(
                        "assets/icons/tracking.svg",
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
