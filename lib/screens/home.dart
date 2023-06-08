import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payworth/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payworth/screens/pay/page1.dart';

class Landing extends StatefulWidget {
  const Landing({super.key, required this.title});

  final String title;

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
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
                color: Color.fromARGB(255, 228, 228, 228),
                child: Column(
                  children: [
                    Container(
                      height: Get.height * 0.77,
                      width: Get.width,
                      padding: EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40))),
                      child: Column(
                        children: [
                          Container(
                            width: Get.width,
                            child: Row(
                              children: [
                                Image.asset(
                                    "assets/images/Frame 270dp_circle (1).png",
                                    height: 40,
                                    width: 40),
                                Spacer(),
                                Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 220, 220, 220))),
                                    child: SvgPicture.asset(
                                        "assets/images/svg/Ellipse 30discover.svg",
                                        height: 40,
                                        width: 40))
                              ],
                            ),
                          ),
                          SizedBox(height: 100),
                          Text(
                            "Worth",
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                          SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "N",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "30,000",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                ),
                              ]),
                          SizedBox(height: 30),
                          const Text(
                            "SafeHaven MFB",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          SizedBox(height: 5),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "0026277722",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 35, 35, 35),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 3),
                                Icon(Icons.copy_rounded, size: 16)
                              ]),
                          SizedBox(height: 50),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Page1(
                                              title: "Pay",
                                            )));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(primaryCol),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 12),
                                  shape: const StadiumBorder()),
                              child: SizedBox(
                                  width: 70,
                                  child: Row(children: [
                                    Text("Pay",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 5),
                                    Image.asset("assets/images/send_2send.png",
                                        height: 30, width: 30),
                                  ]))),
                          Spacer(),
                          Container(
                            width: 100,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 244, 244, 244),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.only(
                          left: 50, right: 50, top: 20, bottom: 20),
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Row(
                        children: [
                          Image.asset("assets/images/home_icon.png",
                              height: 20, width: 20),
                          SizedBox(width: 3),
                          Text(
                            "Home",
                            style: TextStyle(
                                color: Color(primaryCol),
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 40),
                          Image.asset("assets/images/healthbt_menu_2.png",
                              height: 20, width: 20),
                          SizedBox(width: 40),
                          Image.asset("assets/images/receipt-2bt_menu_3.png",
                              height: 20, width: 20),
                          SizedBox(width: 40),
                          Image.asset(
                              "assets/images/profile-circlereceipt-2bt_menu_4.png",
                              height: 20,
                              width: 20)
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
