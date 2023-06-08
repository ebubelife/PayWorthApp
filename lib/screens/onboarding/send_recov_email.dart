import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payworth/constants.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:payworth/screens/onboarding/bvn.dart';
import 'package:payworth/screens/onboarding/second_old.dart';
import 'package:payworth/screens/onboarding/signin.dart';
import 'package:payworth/screens/onboarding/signup.dart';

import '../../components/custom_field.dart';

class RecoverAccount1 extends StatefulWidget {
  const RecoverAccount1({super.key, required this.title});

  final String title;

  @override
  _RecoverAccount1State createState() => _RecoverAccount1State();
}

class _RecoverAccount1State extends State<RecoverAccount1> {
  bool? terms_checked = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.white,
                padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Image.asset(
                      "assets/images/payworth logo v1 1 (1).png",
                      height: 100,
                      width: 180,
                    )),
                    const SizedBox(height: 10),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Recover your account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(
                      height: 9,
                    ),
                    const Text(
                        "Enter your email and we will send you a recovery code.",
                        style: TextStyle(color: Colors.grey, fontSize: 13)),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Email Address",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomField(
                      hint: "Enter your email",
                      readOnly: false,
                    ),
                    const SizedBox(height: 15),
                    const SizedBox(height: 20),
                    Center(
                        child: ElevatedButton(
                            onPressed: () {
                              Get.to(BVN(title: appTitle));
                            },
                            //style button
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(primaryCol),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 7),
                                shape: const StadiumBorder()),
                            child: const Text("Send code"))),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        const Text("I remember my password "),
                        GestureDetector(
                          onTap: () {
                            Get.to(Signin(title: "Payworth - Login"));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Color(primaryCol)),
                          ),
                        ),
                        const Spacer()
                      ],
                    ))
                  ],
                )))));
  }
}
