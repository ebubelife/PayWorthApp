import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:payworth/constants.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:payworth/screens/onboarding/bvn.dart';
import 'package:payworth/screens/onboarding/second_old.dart';
import 'package:payworth/screens/onboarding/set_login_pin.dart';
import 'package:payworth/screens/onboarding/signup.dart';

import '../../components/custom_field.dart';
import '../../components/loaders.dart';
import '../../components/toast.dart';
import '../../services/AuthService.dart';

class Signin extends StatefulWidget {
  const Signin({super.key, required this.title});

  final String title;

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool? terms_checked = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.white,
                padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Image.asset(
                      "assets/images/payworth logo v1 1 (1).png",
                      height: 70,
                      width: 140,
                    )),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text("Login to your account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(
                      height: 9,
                    ),
                    const Text("Make sure that you aleady have an account",
                        style: TextStyle(color: Colors.grey, fontSize: 13)),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Email Address",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomField(
                      hint: "Enter your email",
                      readOnly: false,
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Password",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomField(
                      readOnly: false,
                      hint: "Enter your password",
                      controller: passwordController,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: const Color.fromARGB(255, 255, 255, 255),
                          value: this.terms_checked,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onChanged: (bool? value) {
                            setState(() {
                              terms_checked = value;
                            });
                          },
                        ),
                        const Text("Remember me",
                            style: TextStyle(fontSize: 13)),
                        const Spacer(),
                        Text(
                          "Forgot password?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(primaryCol)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                        child: ElevatedButton(
                            onPressed: () {
                              if (emailController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty)

                              //
                              {
                                loading2("Loading", context);
                                Auth()
                                    .login(
                                      password: passwordController.text,
                                      email: emailController.text,
                                    )
                                    .then((value) => {
                                          if (value == 201)
                                            {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop(),
                                              showToast(
                                                  "Login successful. No login pin found"),
                                              Get.to(SetLoginPin(
                                                  title: "Payworth - Set PIN"))
                                            }
                                          else if (value == 403)
                                            {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop(),
                                              showToast(
                                                  "Sorry, that email doesn't exist")
                                            }
                                          else if (value == 405)
                                            {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop(),
                                              showToast(
                                                  "Sorry, wrong password!")
                                            }
                                          else if (value == 500)
                                            {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop(),
                                              showToast(
                                                  "A server error occurred")
                                            }
                                        });
                              } else {
                                showToast(
                                    "Please fill in all fields correctly");
                              }
                            },
                            //style button
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(primaryCol),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 7),
                                shape: const StadiumBorder()),
                            child: const Text("Sign in"))),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Get.to(SignUp(title: "Payworth - New Account"));
                          },
                          child: Text(
                            "Create a new account",
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
