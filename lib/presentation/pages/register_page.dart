import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/components/elevated_button_widget.dart';
import 'package:neobis_flutter_auth/components/text_form_field.dart';
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
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
    }
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
                TextFormFieldWidget(
                  controller: passwordController,
                  hintText: 'Confirm your password',
                  obscureText: true,
                ),
                SizedBox(height: 10),
                ElevatedButtonWidget(
                  onPressed: signUserUp,
                  text: 'Sign Up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
