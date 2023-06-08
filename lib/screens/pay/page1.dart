import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:payworth/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payworth/screens/pay/page2.dart';

import '../../components/bank_list.dart';
import '../../components/custom_field.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key, required this.title});

  final String title;

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  bool? terms_checked = true;
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController worthController = TextEditingController();
  TextEditingController narrationController = TextEditingController();
  TextEditingController bankController = TextEditingController();

  String bank = "Select bank";
  final List<String> items = bankList();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 20),
                color: Color.fromARGB(255, 227, 227, 227),
                child: Column(
                  children: [
                    Container(
                      height: 20,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      width: 500,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 239, 239, 239),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(20),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(children: [
                        Row(
                          children: [
                            Image.asset(
                                "assets/images/arrow-leftback_arrow.png",
                                height: 30,
                                width: 30),
                            Spacer(),
                            Text("Pay",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17)),
                            Spacer()
                          ],
                        ),
                        SizedBox(height: 60),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "N",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(primaryCol)),
                              ),
                              Text(
                                "0.00",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Color(primaryCol)),
                              ),
                            ]),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: double.maxFinite,
                            child: const Text(
                              "Bank",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                border: Border.all(
                                    width: 1,
                                    color: Color.fromARGB(255, 213, 213, 213))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                hint: Text(
                                  'Select bank',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color.fromARGB(255, 205, 205, 205),
                                  ),
                                ),
                                items: items
                                    .map((item) => DropdownMenuItem<String>(
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

                                    bankController.text = value as String;

                                    print(bankController.text);
                                  });
                                },
                                buttonStyleData: const ButtonStyleData(
                                    height: 40, width: (double.maxFinite) - 30),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            )),
                        SizedBox(height: 20),
                        SizedBox(
                            width: (Get.width) - 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Account Number",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomField(
                                    readOnly: false,
                                    hint: "Account number",
                                    controller: accountNumberController),
                                const SizedBox(
                                  height: 3,
                                ),
                                Container(
                                    width: double.maxFinite,
                                    child: Text(
                                      "Ebube Emeka",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Color(primaryCol),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: (Get.width) - 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Worth (Amount)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomField(
                                    readOnly: false,
                                    hint: "Narration",
                                    controller: accountNumberController),
                                const SizedBox(
                                  height: 3,
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: (Get.width) - 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Narration",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomField(
                                    readOnly: false,
                                    hint: "Narration",
                                    controller: accountNumberController),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                    width: Get.width,
                                    child: Center(
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Page2(
                                                            title: "Pay",
                                                          )));
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(primaryCol),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 25,
                                                    vertical: 9),
                                                shape: const StadiumBorder()),
                                            child: SizedBox(
                                                width: 200,
                                                child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text("Proceed",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      const SizedBox(width: 5),
                                                      Icon(Icons.arrow_forward)
                                                    ]))))),
                              ],
                            )),
                      ]),
                    )),
                  ],
                ))));
  }
}
