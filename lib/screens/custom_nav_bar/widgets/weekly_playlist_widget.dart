import 'package:flick_radio/theme/colors.dart';
import 'package:flutter/material.dart';

class WeeklyPlaylistWidget extends StatelessWidget {
  final String? title;
  const WeeklyPlaylistWidget({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(08),
              color: Colors.grey,
            ),
            child: const Center(
              child: Icon(Icons.playlist_add_check_circle_sharp),
            ),
          ),
          title: Text(
            title!,
            style: TextStyle(
              color: AppColors.primaryWhite,
            ),
          ),
        ),
        Divider(color: Colors.grey.withOpacity(0.5), height: 1, thickness: 1, endIndent: 20, indent: 20),
      ],
    );
  }
}
