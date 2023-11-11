import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../theme/colors.dart';

class CommentCard extends StatelessWidget {
  final dynamic data;
  const CommentCard({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.blueGrey,
            child: Text(
              data['username'][0].toString().toUpperCase(),
              style: TextStyle(
                color: AppColors.primaryWhite,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            data['username'],
            style: TextStyle(
              color: AppColors.primaryWhite,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            data['comment'],
            style: TextStyle(
              color: AppColors.primaryWhite,
              fontSize: 16,
            ),
          ),
          trailing: Text(
            timeago.format(
              data['createdAt'].toDate(),
            ),
            style: TextStyle(color: AppColors.primaryWhite),
          ),
        ),
        const Divider(color: Colors.blueGrey),
      ],
    );
  }
}
