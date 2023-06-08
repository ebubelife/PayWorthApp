import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payworth/constants.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:payworth/screens/onboarding/bvn.dart';
import 'package:payworth/screens/onboarding/second_old.dart';
import 'package:payworth/screens/onboarding/signin.dart';
import 'package:payworth/screens/onboarding/signup.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';
import '../../components/custom_field.dart';
import '../../components/loaders.dart';
import '../../components/toast.dart';
import '../../services/AuthService.dart';
import '../home.dart';
import 'account_created.dart';

class SetTransactionPin extends StatefulWidget {
  const SetTransactionPin({super.key, required this.title});

  final String title;

  @override
  _SetTransactionPinState createState() => _SetTransactionPinState();
}

class _SetTransactionPinState extends State<SetTransactionPin> {
  bool? terms_checked = true;
  String? pinHolder = "";
  bool shiftEnabled = false;

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
                    const SizedBox(
                      height: 30,
                    ),
                    const Center(
                        child: Text("Set Transaction PIN",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16))),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                        child: Text("Enter the code sent to your email below.",
                            style: TextStyle(
                                color: Color.fromARGB(255, 131, 129, 129),
                                fontSize: 13))),
                    const SizedBox(height: 50),

                    Center(
                        child: Container(
                            width: 200,
                            height: 30,
                            padding: EdgeInsets.only(left: 30),
                            child: Center(
                              child: Center(
                                  child: ListView.builder(
                                      itemCount: pinHolder!.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          height: 14,
                                          width: 14,
                                          margin: EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 41, 255, 76),
                                              shape: BoxShape.circle),
                                        );
                                      })),
                            ))),

                    const SizedBox(height: 40),

                    // Wrap the keyboard with Container to set background color.
                    Container(
                        // Keyboard is transparent
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: VirtualKeyboard(
                            // Default height is 300
                            height: 270,
                            // Default height is will screen width
                            width: 400,
                            // Default is black
                            textColor: Color.fromARGB(255, 58, 58, 58),
                            // Default 14
                            fontSize: 20,

                            // the layouts supported
                            //  defaultLayouts = [VirtualKeyboardDefaultLayouts.English],
                            // [A-Z, 0-9]
                            type: VirtualKeyboardType.Numeric,
                            // Callback for key press event
                            onKeyPress: _onKeyPress)),

                    SizedBox(height: 50),

                    Center(
                        child: ElevatedButton(
                            onPressed: () {
                              if (pinHolder!.length == 4) {
                                loading2("Loading", context);
                                Auth()
                                    .setTransactionPin(pin: pinHolder)
                                    .then((value) => {
                                          if (value == 201)
                                            {
                                              showToast(
                                                  "transaction pin set successfully!"),
                                              Get.to(const Landing(
                                                  title: "Payworth - Welcome"))
                                            }
                                          else if (value == 500)
                                            {
                                              showToast(
                                                  "A server error occured , please try again"),
                                            }
                                          else
                                            {
                                              showToast(
                                                  "A server error occured , please try again"),
                                            }
                                        });
                              } else {
                                showToast("Please create a 4-digit pin number");
                              }
                            },
                            //style button
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(primaryCol),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 7),
                                shape: const StadiumBorder()),
                            child: const Text("Continue"))),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )))));
  }

  //onKey press method for virtual keyboard

  /// Fired when the virtual keyboard key is pressed.
  _onKeyPress(VirtualKeyboardKey key) {
    if (key.keyType == VirtualKeyboardKeyType.String && pinHolder!.length < 4) {
      pinHolder = pinHolder! + (shiftEnabled ? key.capsText! : key.text!);
    } else if (key.keyType == VirtualKeyboardKeyType.Action) {
      switch (key.action) {
        case VirtualKeyboardKeyAction.Backspace:
          if (pinHolder!.length == 0) return;
          pinHolder = pinHolder!.substring(0, pinHolder!.length - 1);
          break;
        case VirtualKeyboardKeyAction.Return:
          pinHolder = pinHolder! + '\n';
          break;
        case VirtualKeyboardKeyAction.Space:
          pinHolder = pinHolder! + key.text!;
          break;
        case VirtualKeyboardKeyAction.Shift:
          shiftEnabled = !shiftEnabled;
          break;
        default:
      }
    }
// Update the screen
    setState(() {
      print(pinHolder);
    });
  }
}
