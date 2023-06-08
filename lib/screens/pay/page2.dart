import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:payworth/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payworth/screens/pay/page1.dart';

import '../../components/bank_list.dart';
import '../../components/custom_field.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key, required this.title});

  final String title;

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
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
                            Text("Confirm",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17)),
                            Spacer()
                          ],
                        ),
                        SizedBox(height: 40),
                        Text("Pay to", style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Ebube Emeka",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Color(primaryCol)),
                              ),
                            ]),
                      ]),
                    )),
                  ],
                ))));
  }
}
