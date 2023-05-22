import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_now/app/extensions.dart';

import '../../../../../app/resources/colors/color_manager.dart';
import '../../../../../app/resources/routes/routes_manager.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../../../widgets/home/title_of_items.dart';
import '../../../widgets/main_button.dart';

class PaymentWithCash extends StatelessWidget {
  const PaymentWithCash({super.key});

  @override
  Widget build(BuildContext context) {
    String pricePayed = "\$24.00";
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: context.height * 0.45,
              child: SvgPicture.asset("assets/icons/pay_with_cash.svg")),
          Padding(
            padding: const EdgeInsets.only(
              top: AppSize.s20,
              left: AppSize.s20,
              right: AppSize.s20,
            ),
            child: TitleOfItems(
              title: "Pay with cash",
              fontSize: AppSize.s20.sp,
              fontWeight: FontWeight.bold,
              fontColor: ColorManager.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.s20,
              vertical: AppSize.s30,
            ),
            child: SizedBox(
                width: context.width,
                child: Text(
                  "a Shoplon refundable $pricePayed will be changed to use cash on delivery, if you want to save this amount \nplease switch to Pay with Card.",
                  // maxLines: 3,
                  textAlign: TextAlign.center,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSize.s20),
            child: MainButton(
              text: "Confirm",
              press: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.paymentSuccessScreenRoute);
              },
            ),
          ),
        ],
      ),
    );
  }
}
