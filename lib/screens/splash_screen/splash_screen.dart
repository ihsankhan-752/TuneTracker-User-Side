import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flick_radio/screens/auth/login_screen.dart';
import 'package:flick_radio/screens/custom_nav_bar/custom_nav_bar.dart';
import 'package:flick_radio/theme/colors.dart';
import 'package:flick_radio/utils/navigation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      if (_auth.currentUser != null) {
        navigateToPage(context, const CustomNavBar());
      } else {
        navigateToPage(context, const LoginScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: Center(
        child: Container(
          height: 200,
          width: 250,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/logo.png"),
            fit: BoxFit.contain,
          )),
        ),
      ),
    );
  }
}
