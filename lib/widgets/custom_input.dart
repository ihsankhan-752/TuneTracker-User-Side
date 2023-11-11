import 'package:flick_radio/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLine;

  const CustomInput({Key? key, this.controller, this.maxLine = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLine,
      style: TextStyle(color: AppColors.primaryWhite),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryGrey)
        ),
        focusedBorder:  UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.mainColor)
        )
      ),
    );
  }
}
