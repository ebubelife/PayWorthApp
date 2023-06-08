import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payworth/constants.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:payworth/screens/onboarding/bvn.dart';
import 'package:payworth/screens/onboarding/set_login_pin.dart';
import 'package:payworth/screens/onboarding/second_old.dart';
import 'package:payworth/screens/onboarding/signin.dart';
import 'package:payworth/screens/onboarding/signup.dart';

import '../../components/custom_field.dart';

class AccountCreated extends StatefulWidget {
  const AccountCreated({super.key, required this.title});

  final String title;

  @override
  _AccountCreatedState createState() => _AccountCreatedState();
}

class _AccountCreatedState extends State<AccountCreated> {
  bool? terms_checked = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.white,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Verified!",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 18),
                    Text(
                      "Worth it! Your account has been successfully verified",
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 150),

                    ElevatedButton(
                        onPressed: () {
                          Get.to(Signin(title: "Payworth - Signin"));
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color.fromARGB(255, 244, 244, 244),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 15),
                            shape: const StadiumBorder()),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              color: Color.fromARGB(255, 118, 117, 117)),
                        ))
                    //style button
                  ],
                )))));
  }
}
