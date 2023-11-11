import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flick_radio/screens/custom_nav_bar/widgets/custom_magazine_card.dart';
import 'package:flick_radio/widgets/text_inputs.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool showResult = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                SearchTextInput(
                  searchController: searchController,
                  onChanged: (v) {
                    setState(() {});
                  },
                ),

                SizedBox(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("flickMag").snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(backgroundColor: AppColors.mainColor),
                        );
                      }
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            if (searchController.text.isEmpty) {
                              return CustomMagazineCard(data: snapshot.data!.docs[index]);
                            } else if (snapshot.data!.docs[index]['title']
                                .toString()
                                .toLowerCase()
                                .contains(searchController.text.toLowerCase())) {
                              return CustomMagazineCard(data: snapshot.data!.docs[index]);
                            }
                            return const SizedBox();
                          },
                        ),
                      );
                    },
                  ),
                ),
                // Visibility(
                //   visible: showResult,
                //   child: Column(
                //     children: [
                //       const CustomMagazineCard(
                //         title: 'The Ultimate Guide To Writing',
                //         subTitle: 'Read a Selection of opinion pieces from world class journalist',
                //       ),
                //       const CustomMagazineCard(
                //         title: 'The Ultimate Guide To Writing',
                //         subTitle: 'Read a Selection of opinion pieces from world class journalist',
                //       ),
                //       const SizedBox(height: 30),
                //       InkWell(
                //         onTap: () {
                //           Navigator.of(context).pop();
                //         },
                //         child: Text(
                //           "Exit Search",
                //           style: TextStyle(
                //             fontSize: 22,
                //             color: AppColors.mainColor.withOpacity(0.9),
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
