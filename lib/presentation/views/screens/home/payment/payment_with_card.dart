import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../../../../app/resources/routes/routes_manager.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../../../widgets/main_button.dart';

class PaymentWithCard extends StatefulWidget {
  const PaymentWithCard({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentWithCard> createState() => _PaymentWithCardState();
}

class _PaymentWithCardState extends State<PaymentWithCard> {
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
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          PaymentMethod(
            formKey: formKey,
            cardNumberKey: cardNumberKey,
            cvvCodeKey: cvvCodeKey,
            expiryDateKey: expiryDateKey,
            cardHolderKey: cardHolderKey,
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
