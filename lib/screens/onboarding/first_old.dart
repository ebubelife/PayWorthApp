import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payworth/constants.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:payworth/screens/onboarding/second_old.dart';

class FirstOnboardingOld extends StatefulWidget {
  const FirstOnboardingOld({super.key, required this.title});

  final String title;

  @override
  _FirstOnboardingOldState createState() => _FirstOnboardingOldState();
}

class _FirstOnboardingOldState extends State<FirstOnboardingOld> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/first_onboarding_bg2.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              children: [
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      Get.to(SecondOnboarding(title: appTitle));
                    },
                    child: Text("Get Started"),
                    //style button
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(primaryCol),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        shape: StadiumBorder())),
                SizedBox(
                  height: 100,
                )
              ],
            ))
      ],
    ));
  }
}
