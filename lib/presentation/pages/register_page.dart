import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/components/elevated_button_widget.dart';
import 'package:neobis_flutter_auth/components/text_form_field.dart';
import 'package:neobis_flutter_auth/presentation/pages/home_page.dart';
import 'package:neobis_flutter_auth/styles/app_colors.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserUp() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100),
                Icon(
                  Icons.email,
                  color: Colors.white,
                  size: 100,
                ),
                SizedBox(height: 70),
                TextFormFieldWidget(
                  controller: emailController,
                  hintText: 'Enter your email',
                  obscureText: false,
                ),
                TextFormFieldWidget(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  obscureText: true,
                ),
                SizedBox(height: 70),
                ElevatedButtonWidget(onPressed: signUserUp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
