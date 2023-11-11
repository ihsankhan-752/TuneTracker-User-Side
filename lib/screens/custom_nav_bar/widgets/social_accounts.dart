import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class SocialAccounts extends StatelessWidget {
  final IconData socialIcon;
  const SocialAccounts({Key? key, required this.socialIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.mainColor.withOpacity(0.9),
      ),
      child: Center(
        child: Icon(socialIcon, size: 15),
      ),
    );
  }
}
