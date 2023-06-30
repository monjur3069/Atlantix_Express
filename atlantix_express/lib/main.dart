import 'package:atlantix_express/pages/enter_otp_page.dart';
import 'package:atlantix_express/pages/history_page.dart';
import 'package:atlantix_express/pages/my_account_page.dart';
import 'package:atlantix_express/pages/phone_number_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.spinningCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        builder: EasyLoading.init(),
        initialRoute: PhoneNumberPage.routeName,
        routes: {
          PhoneNumberPage.routeName:(context) => PhoneNumberPage(),
          EnterOtpPage.routeName:(context) => EnterOtpPage(),
          HomePage.routeName:(context) => HomePage(),
          HistoryPage.routeName:(context) => HistoryPage(),
          MyAccountPage.routeName:(context) => MyAccountPage(),
        },
      ),
    );
  }
}

