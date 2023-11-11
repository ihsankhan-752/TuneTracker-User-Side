// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../model/user_model.dart';
import '../screens/auth/login_screen.dart';
import '../screens/custom_nav_bar/custom_nav_bar.dart';
import '../utils/navigation.dart';

class AuthServices {
  static signUp({BuildContext? context, String? username, String? email, String? password}) async {
    try {
      EasyLoading.show(status: "please wait");
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);

      UserModel userModel = UserModel(
        uid: FirebaseAuth.instance.currentUser!.uid,
        email: email,
        username: username,
        isAdmin: false,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(userModel.toMap());

      EasyLoading.dismiss();
      navigateToPage(context!, const LoginScreen());
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message.toString());
      EasyLoading.dismiss();
    }
  }

  static signIn({BuildContext? context, String? email, String? password}) async {
    try {
      EasyLoading.show(status: "Please Wait");
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!);
      EasyLoading.dismiss();
      navigateToPage(context!, const CustomNavBar());
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message.toString());
      EasyLoading.dismiss();
    }
  }

  static loginAnonymously(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      // Anonymous login successful, navigate to the next screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
        return const CustomNavBar();
      }));
    } catch (e) {
      EasyLoading.showError(e.toString());
      EasyLoading.dismiss();
    }
  }

  static signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) {
      return LoginScreen();
    }), (route) => false);
  }
}
