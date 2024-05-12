import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/components/elevated_button_widget.dart';
import 'package:neobis_flutter_auth/components/text_form_field.dart';
import 'package:neobis_flutter_auth/presentation/pages/home_page.dart';
import 'package:neobis_flutter_auth/presentation/pages/login_page.dart';
import 'package:neobis_flutter_auth/styles/app_colors.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void signUserUp() async {
    if (_passwordController.text == _confirmPasswordController.text) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      }).onError((error, stackTrace) {});
    } else {
      showErrorMessage('Passwords don`t match!');
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.black45, fontSize: 20),
              ),
            ),
          );
        });
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
                const SizedBox(height: 100),
                const Icon(
                  Icons.email,
                  color: Colors.white,
                  size: 100,
                ),
                const SizedBox(height: 70),
                TextFormFieldWidget(
                  controller: _emailController,
                  hintText: 'Enter your email',
                  obscureText: false,
                ),
                TextFormFieldWidget(
                  controller: _passwordController,
                  hintText: 'Enter your password',
                  obscureText: true,
                ),
                TextFormFieldWidget(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm your password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
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
