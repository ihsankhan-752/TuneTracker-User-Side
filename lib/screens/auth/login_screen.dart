import 'package:flick_radio/screens/auth/signup_screen.dart';
import 'package:flick_radio/theme/text_styles.dart';
import 'package:flick_radio/widgets/text_inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../services/auth_services.dart';
import '../../theme/app_text.dart';
import '../../theme/colors.dart';
import '../../utils/navigation.dart';
import '../../widgets/buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Center(
                  child: SizedBox(
                    height: 150,
                    width: 200,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
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
                  onPressed: signIn,
                  width: double.infinity,
                  title: 'Login',
                  color: AppColors.mainColor.withOpacity(0.9),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => navigateToPage(context, const SignUpScreen()),
                  child: Center(
                    child: Text("Don't have an Account? SignUp", style: AppTextStyles.signUpTextStyle),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    if (emailController.text.isEmpty) {
      EasyLoading.showError("Email Must Be Filled");
    } else if (passwordController.text.isEmpty) {
      EasyLoading.showError("Password Must Be Filled");
    } else {
      await AuthServices.signIn(
        context: context,
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }
}
