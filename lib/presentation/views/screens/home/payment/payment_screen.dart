import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/home/categories.dart';
import 'payment_with_card.dart';
import '../../../../../app/resources/colors/color_manager.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../../../widgets/home/title_of_items.dart';
import 'payment_with_cash.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentType _paymentType = PaymentType.card;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: AppSize.s20),
              sliver: SliverToBoxAdapter(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryBtn(
                    category: "Pay with card",
                    isActive: _paymentType == PaymentType.card ? true : false,
                    svgSrc: "assets/icons/credit_card.svg",
                    press: () {
                      setState(() {
                        _paymentType = PaymentType.card;
                      });
                    },
                  ),
                  const SizedBox(width: AppSize.s20),
                  CategoryBtn(
                    category: "Pay with cash",
                    svgSrc: "assets/icons/payment_cash.svg",
                    isActive: _paymentType == PaymentType.cash ? true : false,
                    press: () {
                      setState(() {
                        _paymentType = PaymentType.cash;
                      });
                    },
                  ),
                ],
              )),
            ),
            _paymentType == PaymentType.card
                ? const PaymentWithCard()
                : const PaymentWithCash(),
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
      leading: BackButton(color: ColorManager.grey),
      leadingWidth: 0,
      centerTitle: false,

      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s30),
        child: TitleOfItems(title: "Payment method", fontSize: AppSize.s20.sp),
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
    );
  }
}

enum PaymentType {
  card,
  cash,
}
