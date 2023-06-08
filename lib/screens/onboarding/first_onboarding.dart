import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payworth/constants.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:payworth/screens/onboarding/second_old.dart';

import '../../components/onboarding_box.dart';

class FirstOnboarding extends StatefulWidget {
  const FirstOnboarding({super.key, required this.title});

  final String title;

  @override
  _FirstOnboardingState createState() => _FirstOnboardingState();
}

class _FirstOnboardingState extends State<FirstOnboarding> {
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
                  height: 70,
                ),
                Image.asset("assets/images/Group 49first_onboard.png",
                    height: 300, width: 300),
                const SizedBox(
                  height: 30,
                ),
                onboardinBox(
                    "Payments",
                    "Send and receive money from that \nimportant person",
                    "Next",
                    0)
              ],
            )));
  }
}
