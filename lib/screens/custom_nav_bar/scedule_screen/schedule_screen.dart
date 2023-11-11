import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flick_radio/screens/custom_nav_bar/scedule_screen/widgets/program_schedule_card.dart';
import 'package:flutter/material.dart';

import '../../../model/program_schedule_model.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Center(
                child: Text(
              "Programs Schedules",
              style: AppTextStyles.heading1
                  .copyWith(color: AppColors.mainColor.withOpacity(0.9), fontWeight: FontWeight.w600, fontSize: 18),
            )),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('programSchedule').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text("You Program is Found!"),
                          );
                        }
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            ProgramScheduleModel programSchedule =
                                ProgramScheduleModel.fromDoc(snapshot.data!.docs[index]);

                            return ProgramScheduleCard(programSchedule: programSchedule);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              color: AppColors.primaryGrey,
                              thickness: 1,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
