import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class ProgrammeScheduleListTile extends StatelessWidget {
  final dynamic data;
  const ProgrammeScheduleListTile({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['title'],
            style: TextStyle(
              color: AppColors.primaryWhite,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data['day'],
                style: TextStyle(
                  color: AppColors.primaryWhite,
                  fontSize: 14,
                ),
              ),
              Text(
                data['startTime'] + "-" + " " + data['endTime'],
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Divider(color: Colors.blueGrey.withOpacity(0.5), thickness: 1, height: 1)
        ],
      ),
    );
  }
}
