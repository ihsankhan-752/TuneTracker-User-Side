import 'package:flutter/material.dart';

import '../../../../model/program_schedule_model.dart';
import '../../../../theme/text_styles.dart';

class ProgramScheduleCard extends StatelessWidget {
  final ProgramScheduleModel programSchedule;
  const ProgramScheduleCard({super.key, required this.programSchedule});

  @override
  Widget build(BuildContext context) {
    int startTime = programSchedule.startTime;
    int startingHour = startTime ~/ 60;
    int startingMinutes = startTime % 60;

    String formattedStartTime = TimeOfDay(hour: startingHour, minute: startingMinutes).format(context);
    int endTime = programSchedule.endTime;
    int endingHour = endTime ~/ 60;
    int endingMinutes = endTime % 60;

    String formattedEndTime = TimeOfDay(hour: endingHour, minute: endingMinutes).format(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      programSchedule.title,
                      style: AppTextStyles.heading1,
                    ),
                    const Spacer(),
                    Text(
                      programSchedule.selectedDay,
                      style: AppTextStyles.heading2.copyWith(fontWeight: FontWeight.w300, color: Colors.white70),
                    ),
                  ],
                ),
                const SizedBox(height: 03),
                Text(
                  "$formattedStartTime - $formattedEndTime",
                  style: AppTextStyles.heading2.copyWith(fontWeight: FontWeight.w300, color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(width: 30),
        ],
      ),
    );
  }
}
