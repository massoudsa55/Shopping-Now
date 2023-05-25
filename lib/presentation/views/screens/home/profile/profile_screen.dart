import 'package:flutter/material.dart';

import '../../../../../app/resources/values/app_size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            // CircleAvatar(child: Image.asset("url")),
            SizedBox(height: AppSize.s16),
            Text("Full Name"),
          ],
        ),
      ),
    );
  }
}
