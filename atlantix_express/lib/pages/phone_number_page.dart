import 'package:atlantix_express/pages/enter_otp_page.dart';
import 'package:atlantix_express/utils/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PhoneNumberPage extends StatefulWidget {
  static const String routeName = '/phone_number_page';
  const PhoneNumberPage({Key? key}) : super(key: key);
  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  final _phoneController = TextEditingController();
  String vId = '';

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Image.asset(
                'images/phone_verification_page.png',
                height: 275,
                width: 274,
              )),
              SizedBox(
                height: 30,
              ),
              Text(
                'Your Phone Number',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent),
              ),
              SizedBox(
                height: 25,
              ),
              Wrap(
                children: [
                  Text(
                      'Welcome to GM Express! Please enter your phone number below, we\'ll send a verification code at complete your registration'),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'e.g +88016123153',
                  labelText: 'Enter Your Phone Number',
                  prefixIcon: Icon(Icons.phone_android),
                  floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Color(0xff9b9b9b)),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Color(0xff9b9b9b)),
                      borderRadius: BorderRadius.circular(12)),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //send button
              GestureDetector(
                onTap: _verifyPhone,
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  color: Colors.amber,
                  child: Center(
                      child: Text(
                    'Send',
                    style: TextStyle(fontSize: 18),
                  )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Wrap(
                children: [
                  Center(
                      child: Text(
                    'We will send a 6-digit verification code to your number',
                    style: TextStyle(color: Colors.blueAccent),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyPhone() async {
    await EasyLoading.show(status: 'Sending OTP...',dismissOnTap: false,);
    Future.delayed(Duration(seconds: 5));
     await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: _phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        showMsg(context, e.toString());
      },
      codeSent: (String verificationId, int? resendToken) {
        vId = verificationId;
        Navigator.pushNamed(context, EnterOtpPage.routeName, arguments: vId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
