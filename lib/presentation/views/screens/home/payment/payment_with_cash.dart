import 'package:flutter/material.dart';

import '../../../../../app/resources/colors/color_manager.dart';

class PaymentWithCash extends StatelessWidget {
  const PaymentWithCash({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Container(
          height: 200,
          width: 100,
          color: ColorManager.green,
        ),
      ),
    );
  }
}
