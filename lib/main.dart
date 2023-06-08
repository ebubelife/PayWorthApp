import 'package:flutter/material.dart';
import 'package:payworth/constants.dart';
import 'package:payworth/screens/onboarding/first_old.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:payworth/screens/onboarding/first_onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("payworth");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
              title: 'PayWorth - Seamless Payments',
              theme: ThemeData(
                primaryColor: Color(primaryCol),
                fontFamily: 'Poppins',
              ),
              home: FirstOnboarding(title: "Payworth - Seamless Payments"));
        });
  }
}
