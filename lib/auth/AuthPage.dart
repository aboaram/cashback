import 'package:cashback/pages/sub%20pages/authpages/singin_page.dart';
import 'package:cashback/pages/sub%20pages/authpages/singn_up_page.dart';
import 'package:flutter/material.dart';

import '../pages/Login_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // show the login page

  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return SinginPage(showRegisterPage: toggleScreens);
    } else {
      return SignUp(showLoginPage: toggleScreens);
    }
  }
}
