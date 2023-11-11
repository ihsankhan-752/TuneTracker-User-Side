import 'package:flick_radio/screens/custom_nav_bar/playlist_screen/playlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import '../screens/custom_nav_bar/home_screen/home_screen.dart';
import '../screens/custom_nav_bar/magazine_screen/magazine_screen.dart';
import '../screens/custom_nav_bar/more_page_screen/more_pages_screen.dart';
import '../screens/custom_nav_bar/scedule_screen/schedule_screen.dart';

int selectedIndex = 0;
final List<Widget> screens = [
  const HomeScreen(),
  const MagazineScreen(),
  const PlayListScreen(),
  const ScheduleScreen(),
  const MorePagesScreen(),
];

Future contactusValidation({String? name, String? email, String? message}) async {
  if (name == null || name.isEmpty) {
    EasyLoading.showError("Name is required");
  } else if (email == null || email.isEmpty) {
    EasyLoading.showError("Email is required");
  } else if (message == null || message.isEmpty) {
    EasyLoading.showError("Message is required");
  } else {
    try {
      EasyLoading.show(status: "Sending...");
      final Email email = Email(
        body: message,
        subject: name,
        recipients: ['ihsankhan886644@gmail.com'],
        isHTML: false,
      );

      await FlutterEmailSender.send(email);
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
}

Future submitMusicValidation({String? name, String? email, String? about, String? file}) async {
  if (name == null || name.isEmpty) {
    return EasyLoading.showError("Name is required");
  } else if (email == null || email.isEmpty) {
    return EasyLoading.showError("Email is required");
  } else if (about == null || about.isEmpty) {
    return EasyLoading.showError("About is required");
  } else if (file == null || file!.isEmpty) {
    return EasyLoading.showError("File is required");
  } else {
    try {
      final Email email = Email(
        body: about,
        subject: name,
        recipients: ['ihsankhan886644@gmail.com'],
        attachmentPaths: [file!],
        isHTML: false,
      );

      await FlutterEmailSender.send(email);
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
}
