import 'package:flutter/cupertino.dart';

class MyAccountPage extends StatelessWidget {
  static const String routeName = '/my_account';
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("My Account"));
  }
}
