import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:payworth/constants.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:payworth/screens/onboarding/email_verify.dart';

class BVN extends StatefulWidget {
  const BVN({super.key, required this.title});

  final String title;

  @override
  _BVNState createState() => _BVNState();
}

class _BVNState extends State<BVN> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Image.asset("assets/images/user.png"),
                  const SizedBox(height: 50),
                  Text(
                    "Verify your identity \n with your BVN",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(primaryCol),
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                      maxLength: 11,
                      decoration: InputDecoration(
                          hintText: "BVN",
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: SvgPicture.asset(
                            "assets/images/svg/padlock 1 (1).svg",
                            height: 2, width: 2,
                            // color: Colors.red,
                          ))),
                  SizedBox(height: 30),
                  Text(
                    "By inserting your BVN, you are giving payworth the consent to create a bank account with your basic data. Your BVN data will not be shared with a third party.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(EmailVerify(title: appTitle));
                          },
                          //style button
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(primaryCol),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              shape: const StadiumBorder()),
                          child: const Text("Verify"))),
                ],
              ),
            )));
  }
}
