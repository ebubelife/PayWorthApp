import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payworth/constants.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:payworth/screens/onboarding/second_old.dart';

import '../../components/onboarding_box.dart';

class SecondOnboarding extends StatefulWidget {
  const SecondOnboarding({super.key, required this.title});

  final String title;

  @override
  _SecondOnboardingState createState() => _SecondOnboardingState();
}

class _SecondOnboardingState extends State<SecondOnboarding> {
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
                Image.asset("assets/images/secure-shield 1.png",
                    height: 250, width: 300),
                const SizedBox(
                  height: 30,
                ),
                onboardinBox(
                  "Security",
                  "Safety first, always.",
                  "Next",
                  1,
                )
              ],
            )));
  }
}
