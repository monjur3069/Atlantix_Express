import 'package:atlantix_express/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class EnterOtpPage extends StatefulWidget {
  static const String routeName = '/enter_otp_page';
  const EnterOtpPage({Key? key}) : super(key: key);

  @override
  State<EnterOtpPage> createState() => _EnterOtpPageState();
}

class _EnterOtpPageState extends State<EnterOtpPage> {

  final otpController = TextEditingController();
  String vId = '';

 @override
  void didChangeDependencies() {
   EasyLoading.dismiss();
   vId = ModalRoute.of(context)!.settings.arguments as String;
   print(vId);
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    otpController.dispose();
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
              SizedBox(height: 50,),
              Center(child: Image.asset('images/otp_page.png',height: 275,width: 274,)),
              SizedBox(height: 30,),
              Text('Enter OTP',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.blueAccent),),
              SizedBox(height: 25,),
              Wrap(
                children: [
                  Text('Your account is already ready! Please enter the 6 digit OTP code we just send to your phone number.'),
                ],
              ),
              SizedBox(height: 25,),
              PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(2),
                  fieldHeight: 45,
                  fieldWidth: 55,

                  selectedFillColor: Colors.grey,
                  selectedBorderWidth: 1,
                  selectedColor: Colors.black,

                  activeColor: Colors.black,
                  activeBorderWidth: 1,
                  activeFillColor: Colors.white,

                  inactiveColor: Colors.black,
                  inactiveBorderWidth: 1,
                  inactiveFillColor: Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.white,
                enableActiveFill: true,
                //errorAnimationController: errorController,
                controller: otpController,
                onChanged: (value) {
                  if(value.length == 6) {
                    /*EasyLoading.show(status: 'Please Wait');
                    _verifyOtp();*/
                  }
                },
              ),
              SizedBox(height: 15,),
              //send button
              GestureDetector(
                onTap: _verifyOtp,
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  color: Colors.amber,
                  child: Center(child: Text('Verify',style: TextStyle(fontSize: 18),)),
                ),
              ),
              SizedBox(height: 15,),
              Wrap(
                children: [
                  Center(child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Don\'t forget your OTP yet?',style: TextStyle(color: Colors.blueAccent),),
                      SizedBox(width: 5,),
                      Text('Resend OTP',style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyOtp() {
   EasyLoading.show(status: 'Please Wait...',dismissOnTap: false);
    PhoneAuthCredential credential = PhoneAuthProvider
        .credential(verificationId: vId, smsCode: otpController.text);
    FirebaseAuth.instance.signInWithCredential(credential)
        .then((credentialUser) {
      if(credentialUser != null) {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      }
    });
  }
}
