import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payworth/constants.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:payworth/screens/onboarding/email_verify.dart';
import 'package:payworth/screens/onboarding/second_old.dart';
import 'package:payworth/screens/onboarding/signin.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../components/toast.dart';
import '../../components/loaders.dart';
import '../../components/custom_field.dart';
import '../../services/AuthService.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key, required this.title});

  final String title;

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool? terms_checked = true;
  final List<String> items = [
    'Female',
    'Male',
  ];
  String? selectedValue;

  //text controllers

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  String gender = "gender";
  String dob = "";
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      SizedBox(
                          width: (Get.width / 2) - 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "First Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomField(
                                readOnly: false,
                                hint: "First Name",
                                controller: firstNameController,
                              )
                            ],
                          )),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                          width: (Get.width / 2) - 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Last Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomField(
                                  readOnly: false,
                                  hint: "Last Name",
                                  controller: lastNameController)
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Worth tag (Username)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomField(
                            readOnly: false,
                            hint: "Username",
                            controller: usernameController)
                      ],
                    )),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Phone Number",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomField(
                          readOnly: false,
                          hint: "+234",
                          controller: phoneController,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Email Address",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomField(
                          readOnly: false,
                          hint: "Email Address",
                          controller: emailController,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      SizedBox(
                          width: (Get.width / 2) - 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      border: Border.all(
                                          width: 1,
                                          color: Color.fromARGB(
                                              255, 213, 213, 213))),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      hint: Text(
                                        'Gender',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color.fromARGB(
                                              255, 205, 205, 205),
                                        ),
                                      ),
                                      items: items
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      value: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value as String;

                                          genderController.text =
                                              value as String;

                                          print(genderController.text);
                                        });
                                      },
                                      buttonStyleData: const ButtonStyleData(
                                        height: 40,
                                        width: 140,
                                      ),
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        height: 40,
                                      ),
                                    ),
                                  )),
                            ],
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                          width: (Get.width / 2) - 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Date of Birth",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomField(
                                readOnly: true,
                                hint: "09/04/23",
                                controller: dobController,
                                onTapped: () async {
                                  //show date picker to pick date of birth
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate:
                                          DateTime.now(), //get today's date
                                      firstDate: DateTime(
                                          2000), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101));
                                  if (pickedDate != null) {
                                    dobController.text =
                                        pickedDate!.day.toString() +
                                            "/" +
                                            pickedDate!.month.toString() +
                                            "/" +
                                            pickedDate!.year.toString();
                                  }
                                },
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "House Address",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        CustomField(
                          readOnly: false,
                          hint: "Address",
                          controller: addressController,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        CustomField(
                          readOnly: false,
                          obscureText: passwordVisible,
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color.fromARGB(255, 135, 134, 134),
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                          hint: "Password ",
                          controller: passwordController,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 3,
                ),
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
                    const SizedBox(
                      width: 2,
                    ),
                    const Text(
                        "I agree to the terms and conditions by \n creating an account.",
                        style: TextStyle(fontSize: 13))
                  ],
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                    onPressed: () {
                      // Get.to(EmailVerify(title: "Verify Email"));

                      if (emailController.text.isNotEmpty &&
                          firstNameController.text.isNotEmpty &&
                          lastNameController.text.isNotEmpty &&
                          phoneController.text.isNotEmpty &&
                          addressController.text.isNotEmpty &&
                          usernameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty &&
                          genderController.text != "Gender")
                      //
                      {
                        loading2("Loading", context);
                        Auth()
                            .signup(
                                username: usernameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                dob: dobController.text,
                                gender: genderController.text.toString(),
                                phone: phoneController.text,
                                address: addressController.text,
                                firstName: firstNameController.text,
                                lastName: lastNameController.text)
                            .then((value) => {
                                  if (value == 201)
                                    {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(),
                                      showToast(
                                          "Your account has been created"),
                                      Get.to(EmailVerify(
                                          title: "verify your email aadress"))
                                    }
                                  else if (value == 406)
                                    {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(),
                                      showToast(
                                          "An error occured! Please fill all fields properly and try again.")
                                    }
                                  else if (value == 401)
                                    {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(),
                                      showToast(
                                          "That email is already in use. Please try again!")
                                    }
                                  else if (value == 403)
                                    {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(),
                                      showToast(
                                          "That email is invalid. Please try again")
                                    }
                                });
                      } else {
                        showToast("Please fill in all fields correctly");
                      }
                    },
                    child: const Text("Create Account"),
                    //style button
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(primaryCol),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 7),
                        shape: const StadiumBorder())),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    const Text("Have an account?"),
                    GestureDetector(
                      onTap: () {
                        Get.to(const Signin(title: "Payworth - Login"));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Color(primaryCol)),
                      ),
                    ),
                    const Spacer()
                  ],
                )),
                const SizedBox(height: 20),
              ],
            )))));
  }
}
