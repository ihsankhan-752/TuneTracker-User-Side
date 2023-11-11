import 'package:cloud_firestore/cloud_firestore.dart';

class ProgramScheduleModel {
  final String docId;
  final String uid;
  final String title;
  final String selectedDay;
  final int startTime;
  final int endTime;

  ProgramScheduleModel({
    required this.docId,
    required this.endTime,
    required this.startTime,
    required this.selectedDay,
    required this.title,
    required this.uid,
  });

  factory ProgramScheduleModel.fromDoc(DocumentSnapshot snap) {
    return ProgramScheduleModel(
      docId: snap['docId'],
      endTime: snap['endTime'],
      startTime: snap['startTime'],
      selectedDay: snap['selectedDay'],
      title: snap['title'],
      uid: snap['uid'],
    );
  }
}
