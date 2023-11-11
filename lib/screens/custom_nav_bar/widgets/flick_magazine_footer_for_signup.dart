import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../utils/navigation.dart';
import '../../auth/signup_screen.dart';

class FlickMagazineFooterForSignUp extends StatelessWidget {
  const FlickMagazineFooterForSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: InkWell(
        onTap: () {
          navigateToPage(context, const SignUpScreen());
        },
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.mainColor.withOpacity(0.9),
              ),
              child: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.primaryWhite),
            ),
            const SizedBox(width: 10),
            Text(
              "Sign Up To Read More",
              style: TextStyle(
                color: AppColors.primaryWhite,
              ),
            )
          ],
        ),
      ),
    );
  }
}
