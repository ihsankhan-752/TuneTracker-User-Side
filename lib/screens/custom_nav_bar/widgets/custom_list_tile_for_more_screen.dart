import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class CustomListTileForMoreScreen extends StatelessWidget {
  final String? title;
  final IconData? icon;
  const CustomListTileForMoreScreen({Key? key, this.title, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title!,
            style: TextStyle(
              color: AppColors.primaryWhite,
            ),
          ),
          trailing: Icon(icon, color: AppColors.primaryWhite),
        ),
        const Divider(
          thickness: 1,
          height: 1,
          color: Colors.blueGrey,
          endIndent: 20,
          indent: 20,
        ),
      ],
    );
  }
}
