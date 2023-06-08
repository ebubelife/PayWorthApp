import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payworth/constants.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:payworth/screens/onboarding/second_old.dart';

import '../../components/onboarding_box.dart';

class ThirdOnboarding extends StatefulWidget {
  const ThirdOnboarding({super.key, required this.title});

  final String title;

  @override
  _ThirdOnboardingState createState() => _ThirdOnboardingState();
}

class _ThirdOnboardingState extends State<ThirdOnboarding> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Image.asset("assets/images/offer-checklist 1.png",
                    height: 250, width: 300),
                const SizedBox(
                  height: 30,
                ),
                onboardinBox("Bills", "Pay bills, buy and borrow airtime",
                    "Create account", 2)
              ],
            )));
  }
}
