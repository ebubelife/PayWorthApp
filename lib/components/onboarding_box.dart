import 'package:flutter/material.dart';

import 'button.dart';

onboardinBox(String title, subtitle, buttonText, int position) {
  return Container(
      child: Column(
    children: [
      Container(
          height: 250,
          width: double.maxFinite,
          decoration: const BoxDecoration(
              color: Color(0xff526CE2),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Stack(
            children: [
              Positioned(
                left: 25,
                top: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Container(child: buttonOne(buttonText, position)),
              ),
            ],
          )),
      SizedBox(height: 40),
      Text(
        "24/7 Customer support that never sleeps.",
        style: TextStyle(fontSize: 13, color: Colors.grey),
      )
    ],
  ));
}
