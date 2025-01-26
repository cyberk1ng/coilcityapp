/* import 'package:flutter/material.dart';
import 'package:playground/pages/login_page.dart';
import 'package:playground/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  // this will intially show a login page

  bool showLoginPage = true;

  // toggle for swiping between the 2 pages
  void togglepage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return Login(onTap: togglepage);
    } else {
      return RegisterPage(onTap: togglepage); 
    }
  }
} */