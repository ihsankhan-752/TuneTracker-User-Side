import 'package:flick_radio/theme/text_styles.dart';
import 'package:flick_radio/widgets/text_inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../services/auth_services.dart';
import '../../theme/app_text.dart';
import '../../theme/colors.dart';
import '../../utils/navigation.dart';
import '../../widgets/buttons.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 150,
                    width: 200,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                const SizedBox(height: 20),
                Text(AppText.name, style: AppTextStyles.signUpTextStyle),
                const SizedBox(height: 10),
                AuthTextInput(controller: usernameController, hintText: 'Name'),
                const SizedBox(height: 20),
                Text(AppText.email, style: AppTextStyles.signUpTextStyle),
                const SizedBox(height: 10),
                AuthTextInput(controller: emailController, hintText: 'Email'),
                const SizedBox(height: 20),
                Text(AppText.password, style: AppTextStyles.signUpTextStyle),
                const SizedBox(height: 10),
                AuthTextInput(controller: passwordController, hintText: 'Password'),
                const SizedBox(height: 40),
                PrimaryButton(
                  onPressed: () {
                    signUp();
                  },
                  width: double.infinity,
                  title: 'Register',
                  color: AppColors.mainColor.withOpacity(0.9),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => navigateToPage(context, const LoginScreen()),
                  child: Center(
                    child: Text(AppText.alreadyHaveAcc, style: AppTextStyles.signUpTextStyle),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    if (emailController.text.isEmpty) {
      EasyLoading.showError('Email Must Be Filled');
    } else if (passwordController.text.isEmpty) {
      EasyLoading.showError('Password Must Be Filled');
    } else if (usernameController.text.isEmpty) {
      EasyLoading.showError('username Must Be Filled');
    } else {
      await AuthServices.signUp(
        context: context,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
    }
    setState(() {
      emailController.clear();
      usernameController.clear();
      passwordController.clear();
    });
  }
}
