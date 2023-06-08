import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payworth/constants.dart';
import 'package:payworth/screens/onboarding/signin.dart';
import 'package:payworth/screens/onboarding/signup.dart';

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
      padding: const EdgeInsets.only(left: 8, right: 8),
      color: Color(primaryCol),
      child: Column(children: [
        const Spacer(),
        const Text(
          "Global Neobank For An Executive Clientele",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 45,
        ),
        const Text(
          "Powered by a shared purpose of advancing sustainable financial opportunities for money transfer, bill payments, borrowing airtime and 24/7 customer support. We are powered by this purpose and we want to share it with you.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
        const SizedBox(
          height: 25,
        ),
        ElevatedButton(
            onPressed: () {
              Get.to(const SignUp(title: "Payworth - Signin"));
            },
            //style button
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffffffff),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 6),
                shape: const StadiumBorder()),
            child: Text(
              "Get Started",
              style: TextStyle(
                  color: Color(primaryCol),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          height: 100,
        ),
        const SizedBox(height: 20)
      ]),
    ));
  }
}
