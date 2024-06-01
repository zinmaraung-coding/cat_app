import 'package:cat_app_project/pages/login_page.dart';
import 'package:cat_app_project/pages/register_page.dart';
import 'package:flutter/cupertino.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // Initially, Show Login Page
  bool showLoginPage  = true;

  //toggle between login and register page
  void togglePages()  {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    }
    else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
