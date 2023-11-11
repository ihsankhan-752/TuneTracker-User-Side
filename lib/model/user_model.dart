import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? username;
  String? email;
  bool? isAdmin;

  UserModel({this.uid, this.email, this.username, this.isAdmin});

  factory UserModel.fromDocument(DocumentSnapshot snap) {
    return UserModel(
      uid: snap['uid'],
      username: snap['username'],
      email: snap['email'],
      isAdmin: snap['isAdmin'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'isAdmin': isAdmin,
    };
  }
}
