import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/components/elevated_button_widget.dart';
import 'package:neobis_flutter_auth/components/text_form_field.dart';

import 'package:neobis_flutter_auth/presentation/pages/register_page.dart';
import 'package:neobis_flutter_auth/styles/app_colors.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
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
          child: Form(
            key: _formKey,
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
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Электронная почта не может быть пустой';
                      } else if (value != emailController) {
                        return 'Неправильная электронная почта';
                      }
                      return null;
                    },
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  TextFormFieldWidget(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пароль не может быть пустым';
                      } else if (value != passwordController) {
                        return 'Неправильный пароль';
                      }
                      return null;
                    },
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 70),
                  ElevatedButtonWidget(
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont`t have an account yet?',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: signUserUp,
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
