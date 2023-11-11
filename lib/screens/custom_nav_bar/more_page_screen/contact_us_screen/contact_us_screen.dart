import 'package:flick_radio/theme/text_styles.dart';
import 'package:flick_radio/widgets/buttons.dart';
import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../../../utils/global.dart';
import '../../../../widgets/custom_input.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();


  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.primaryBlack,
        title: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset('images/logo.png'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: AppTextStyles.heading3.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.mainColor,
                ),
              ),
              CustomInput(
                controller: nameController,
              ),
              const SizedBox(height: 25),
              Text(
                "Email",
                style: AppTextStyles.heading3.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.mainColor,
                ),
              ),
              CustomInput(
                controller: emailController,
              ),
              const SizedBox(height: 25),
              Text(
                "Message",
                style: AppTextStyles.heading3.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.mainColor,
                ),
              ),
              CustomInput(
                controller: messageController,maxLine: 6,
              ),
              const SizedBox(height: 25),
              PrimaryButton(
                title: "Send",
                width: double.infinity,
                color: AppColors.mainColor.withOpacity(0.9),
                onPressed: () async {
                  await contactusValidation(
                      name: nameController.text,
                      email: emailController.text,
                      message: messageController.text).then((value) {
                        setState(() {
                          nameController.clear();
                          emailController.clear();
                          messageController.clear();
                        });
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
