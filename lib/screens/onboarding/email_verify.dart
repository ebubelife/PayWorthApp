import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payworth/constants.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:payworth/screens/onboarding/bvn.dart';
import 'package:payworth/screens/onboarding/second_old.dart';
import 'package:payworth/screens/onboarding/signin.dart';
import 'package:payworth/screens/onboarding/signup.dart';

import '../../components/custom_field.dart';
import '../../components/toast.dart';
import '../../services/AuthService.dart';
import 'account_created.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key, required this.title});

  final String title;

  @override
  _EmailVerifyState createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  bool? terms_checked = true;
  TextEditingController codeController = new TextEditingController();
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
                      height: 60,
                      width: 130,
                    )),
                    const SizedBox(
                      height: 100,
                    ),
                    const Text("One more step...",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(
                      height: 9,
                    ),
                    const Text("Enter the code sent to your email below.",
                        style: TextStyle(color: Colors.grey, fontSize: 13)),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomField(
                      hint: "_ _ _ _",
                      maxL: 4,
                      readOnly: false,
                      controller: codeController,
                    ),
                    const SizedBox(height: 15),
                    const SizedBox(height: 20),
                    Center(
                        child: ElevatedButton(
                            onPressed: () {
                              if (codeController.text.isNotEmpty) {
                                Auth()
                                    .verifyEmail(code: codeController.text)
                                    .then((value) => {
                                          if (value == 201)
                                            {
                                              showToast(
                                                  "Successfully verified your email"),
                                              Get.to(const AccountCreated(
                                                  title: "Payworth - Success"))
                                            }
                                          else if (value == 400)
                                            {
                                              showToast(
                                                  "That code is invalid. Please try again"),
                                            }
                                          else
                                            {
                                              showToast(
                                                  "A network error occurred. Please try again"),
                                            }
                                        });
                              } else {
                                showToast("Enter the code sent to your email");
                              }
                            },
                            //style button
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(primaryCol),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 7),
                                shape: const StadiumBorder()),
                            child: const Text("Verify email"))),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        const Text("Didn't receive an email?"),
                        GestureDetector(
                          onTap: () {
                            Get.to(Signin(title: "Payworth - Login"));
                          },
                          child: Text(
                            "Resend",
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
