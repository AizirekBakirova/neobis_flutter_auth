import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/components/elevated_button_widget.dart';
import 'package:neobis_flutter_auth/components/text_form_field.dart';
import 'package:neobis_flutter_auth/presentation/pages/home_page.dart';
import 'package:neobis_flutter_auth/presentation/pages/register_page.dart';
import 'package:neobis_flutter_auth/styles/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void goToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    );
  }

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          ),
        );
    Navigator.pop(context);

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
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
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty';
                      } else if (value != _emailController) {
                        return 'Incorrect email';
                      }
                      return null;
                    },
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  TextFormFieldWidget(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      } else if (value != _passwordController) {
                        return 'Incorrect password';
                      }
                      return null;
                    },
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 70),
                  ElevatedButtonWidget(
                    onPressed: signUserIn,
                    text: 'Sign In',
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont`t have an account yet?',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: goToSignUp,
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
