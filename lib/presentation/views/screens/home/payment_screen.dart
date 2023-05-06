import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/resources/colors/color_manager.dart';
import '../../../../app/resources/routes/routes_manager.dart';
import '../../../../app/resources/values/app_size.dart';
import '../../widgets/home/categories.dart';
import '../../widgets/home/title_of_items.dart';
import '../../widgets/main_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final GlobalKey<FormFieldState<String>> cardNumberKey =
        GlobalKey<FormFieldState<String>>();
    final GlobalKey<FormFieldState<String>> cvvCodeKey =
        GlobalKey<FormFieldState<String>>();
    final GlobalKey<FormFieldState<String>> expiryDateKey =
        GlobalKey<FormFieldState<String>>();
    final GlobalKey<FormFieldState<String>> cardHolderKey =
        GlobalKey<FormFieldState<String>>();
    String cardNumber = '1548549596',
        expiryDate = '10/24',
        cardHolderName = 'Visa',
        cvvCode = '45662';
    bool showBackView = true;
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
          child:
              TitleOfItems(title: "Payment method", fontSize: AppSize.s20.sp),
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
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: AppSize.s16),
            sliver: SliverToBoxAdapter(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryBtn(
                  category: "Pay with card",
                  isActive: true,
                  svgSrc: "assets/icons/credit_card.svg",
                  press: () {},
                ),
                const SizedBox(width: AppSize.s20),
                CategoryBtn(
                  category: "Pay with cash",
                  svgSrc: "assets/icons/payment_cash.svg",
                  isActive: false,
                  press: () {},
                ),
              ],
            )),
          ),
          SliverToBoxAdapter(
            child: PaymentMethod(
              formKey: formKey,
              cardNumberKey: cardNumberKey,
              cvvCodeKey: cvvCodeKey,
              expiryDateKey: expiryDateKey,
              cardHolderKey: cardHolderKey,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(AppSize.s20),
            sliver: SliverToBoxAdapter(
                child: MainButton(
              text: "Confirm",
              press: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.paymentSuccessScreenRoute);
              },
            )),
          ),
        ],
      )),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
    required this.formKey,
    required this.cardNumberKey,
    required this.cvvCodeKey,
    required this.expiryDateKey,
    required this.cardHolderKey,
    this.cardNumber = '12345678910123',
    this.expiryDate = '10/24',
    this.cardHolderName = 'Messaoud Benkouider',
    this.cvvCode = '433',
    this.showBackView = false,
  });

  final GlobalKey<FormState> formKey;
  final GlobalKey<FormFieldState<String>> cardNumberKey,
      cvvCodeKey,
      expiryDateKey,
      cardHolderKey;
  final String cardNumber, expiryDate, cardHolderName, cvvCode;
  final bool showBackView;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCodeKey.toString(),
          showBackView: showBackView,
          backgroundImage: "assets/images/card_bg.png",
          bankName: "Paysera",
          cardType: CardType.visa,
          onCreditCardWidgetChange: (p0) {},
          glassmorphismConfig: Glassmorphism(
            blurX: 10.0,
            blurY: 10.0,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.grey.withAlpha(20),
                Colors.white.withAlpha(20),
              ],
              stops: const <double>[
                0.3,
                0,
              ],
            ),
          ),
          isHolderNameVisible: true,
        ),
        CreditCardForm(
          formKey: formKey, // Required
          cardNumber: cardNumber,
          cardNumberKey: cardNumberKey,
          cvvCodeKey: cvvCodeKey,
          expiryDateKey: expiryDateKey,
          cardHolderKey: cardHolderKey,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCodeKey.toString(),
          onCreditCardModelChange: (CreditCardModel data) {}, // Required
          themeColor: Colors.red,
          obscureCvv: true,
          obscureNumber: true,
          isHolderNameVisible: true,
          isCardNumberVisible: true,
          isExpiryDateVisible: true,
          enableCvv: true,
          cardNumberValidator: (String? ncardNumber) {
            // cardNumber = ncardNumber!;

            return null;
          },
          expiryDateValidator: (String? nexpiryDate) {
            // expiryDate = nexpiryDate!;

            return null;
          },
          cvvValidator: (String? cvv) {
            // cvvCode = cvv!;

            return null;
          },
          cardHolderValidator: (String? ncardHolderName) {
            // cardHolderName = ncardHolderName!;

            return null;
          },
          onFormComplete: () {
            // callback to execute at the end of filling card data
          },
          cardNumberDecoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Number',
            hintText: 'XXXX XXXX XXXX XXXX',
          ),
          expiryDateDecoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Expired Date',
            hintText: 'XX/XX',
          ),
          cvvCodeDecoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'CVV',
            hintText: 'XXX',
          ),
          cardHolderDecoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Card Holder',
          ),
        ),
      ],
    );
  }
}
