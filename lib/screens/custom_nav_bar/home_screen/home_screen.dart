// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flick_radio/screens/custom_nav_bar/home_screen/widgets/our_show_card.dart';
import 'package:flutter/material.dart';

import '../../../model/show_model.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';
import '../../../utils/navigation.dart';
import '../../auth/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: 150,
                    child: Image.asset('images/logo.png'),
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        navigateToPage(context, const LoginScreen());
                      },
                      child: Icon(Icons.logout, size: 25, color: AppColors.mainColor)),
                ],
              ),
              Divider(color: AppColors.mainColor),
              const SizedBox(height: 30),
              Text(
                "Shows",
                style: AppTextStyles.heading1
                    .copyWith(color: AppColors.mainColor.withOpacity(0.9), fontWeight: FontWeight.w600, fontSize: 18),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('ourShow').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Column(
                          children: [
                            Text("No Show is Found Yet!", style: AppTextStyles.heading1),
                            const SizedBox(height: 10),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        ShowModel showModel = ShowModel.fromDoc(snapshot.data!.docs[index]);
                        return OurShowCard(showModel: showModel);
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
