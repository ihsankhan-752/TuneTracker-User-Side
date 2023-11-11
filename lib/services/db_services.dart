import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DatabaseServices {
  static makeAComment({String? id, String? comment}) async {
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();

    try {
      EasyLoading.show(status: "Please Wait");
      await FirebaseFirestore.instance.collection("flickMag").doc(id).collection("comments").add({
        "uid": FirebaseAuth.instance.currentUser!.uid,
        'username': snap['username'],
        'createdAt': DateTime.now(),
        'comment': comment,
      });
      EasyLoading.dismiss();
    } on FirebaseException catch (e) {
      EasyLoading.showError(e.message.toString());

      EasyLoading.dismiss();
    }
  }
}
