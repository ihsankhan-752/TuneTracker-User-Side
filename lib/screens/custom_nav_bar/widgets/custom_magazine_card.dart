import 'package:flick_radio/utils/navigation.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../magazine_screen/comment_screen.dart';

class CustomMagazineCard extends StatelessWidget {
  final dynamic data;
  const CustomMagazineCard({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(data['image']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Text(
              data['title'],
              style: TextStyle(
                color: AppColors.primaryWhite,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () => navigateToPage(context, CommentScreen(id: data['id'])),
              child: Icon(Icons.comment, color: AppColors.mainColor),
            ),
          ],
        ),
        const SizedBox(height: 02),
        Text(
          data['description'],
          style: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
