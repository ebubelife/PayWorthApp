import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:payworth/screens/onboarding/signup.dart';

import '../screens/onboarding/second_onboarding.dart';
import '../screens/onboarding/third_onboarding.dart';

buttonOne(String buttonText, int position) {
  //positon is the current onboarding screen in display
  return ElevatedButton(
      onPressed: () {
        if (position == 0) {
          Get.to(SecondOnboarding(title: "Payworth"));
        } else if (position == 1) {
          Get.to(ThirdOnboarding(title: "Payworth"));
        } else if (position == 2) {
          Get.to(SignUp(title: "Payworth - Create Account"));
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffffffff),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          shape: const StadiumBorder()),
      child: Row(children: [
        Text(
          buttonText,
          style: TextStyle(
            color: Color(0xff526CE2),
            fontSize: 12,
          ),
        ),
        const SizedBox(
          width: 5,
        ),

        //if current screen isn't the third one counting from zero, do not display icon
        position != 2
            ? const Icon(
                Icons.arrow_forward,
                color: Color(0xff526CE2),
              )
            : SizedBox()
      ]));
  //style button
}
