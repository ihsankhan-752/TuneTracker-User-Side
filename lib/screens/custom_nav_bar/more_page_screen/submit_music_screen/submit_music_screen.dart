import 'package:file_picker/file_picker.dart';
import 'package:flick_radio/theme/text_styles.dart';
import 'package:flick_radio/widgets/buttons.dart';
import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../../../utils/global.dart';
import '../../../../widgets/custom_input.dart';

class SubmitMusicScreen extends StatefulWidget {
  const SubmitMusicScreen({Key? key}) : super(key: key);

  @override
  State<SubmitMusicScreen> createState() => _SubmitMusicScreenState();
}

class _SubmitMusicScreenState extends State<SubmitMusicScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController aboutUrSelfController = TextEditingController();

  String ? file;
  pickFile() async {
    await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: false,
    ).then((value){
      setState(() {
        file = value!.paths.first;
      });
    });

  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    aboutUrSelfController.dispose();
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
                "A little about yourself",
                style: AppTextStyles.heading3.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.mainColor,
                ),
              ),
              CustomInput(
                controller: aboutUrSelfController,
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    child: PrimaryButton(
                      color: AppColors.mainColor.withOpacity(0.90),
                      title: "choose file",
                      onPressed: ()async{
                        await pickFile();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      file ?? "No file selected",
                      style: AppTextStyles.heading3
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400,color: AppColors.primaryWhite),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
              PrimaryButton(
                title: "Send",
                width: double.infinity,
                color: AppColors.mainColor.withOpacity(0.9),
                onPressed: () async {
                  await submitMusicValidation(
                          name: nameController.text,
                          email: emailController.text,
                          about: aboutUrSelfController.text,
                    file: file
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
