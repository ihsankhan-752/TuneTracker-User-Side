import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flick_radio/screens/custom_nav_bar/magazine_screen/widgets/comment_card.dart';
import 'package:flick_radio/services/db_services.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class CommentScreen extends StatefulWidget {
  final dynamic id;
  const CommentScreen({Key? key, this.id}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(0.3),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: AppColors.primaryWhite),
              controller: commentController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "write a comment...",
                hintStyle: TextStyle(
                  color: AppColors.primaryWhite.withOpacity(0.5),
                ),
                suffixIcon: InkWell(
                    onTap: () async {
                      await DatabaseServices.makeAComment(
                        id: widget.id,
                        comment: commentController.text,
                      );
                      setState(() {
                        commentController.clear();
                      });
                    },
                    child: Icon(Icons.send, color: AppColors.primaryWhite.withOpacity(0.5))),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlack,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.mainColor,
        ),
        title: Text(
          "Comments",
          style: TextStyle(
            color: AppColors.mainColor,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("flickMag").doc(widget.id).collection("comments").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(backgroundColor: AppColors.mainColor),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                "No Comment Found",
                style: TextStyle(
                  color: AppColors.mainColor,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return CommentCard(data: snapshot.data!.docs[index]);
            },
          );
        },
      ),
    );
  }
}
