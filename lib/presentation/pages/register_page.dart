import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/components/elevated_button_widget.dart';
import 'package:neobis_flutter_auth/components/text_form_field.dart';

import 'package:neobis_flutter_auth/presentation/pages/home_page.dart';
import 'package:neobis_flutter_auth/styles/app_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey();
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
                  SizedBox(height: 100),
                  Icon(
                    Icons.email,
                    color: Colors.white,
                    size: 100,
                  ),
                  SizedBox(height: 70),
                  TextFormFieldWidget(
                    hintText: 'Enter your email',
                  ),
                  TextFormFieldWidget(
                    hintText: 'Enter your password',
                  ),
                  SizedBox(height: 70),
                  ElevatedButtonWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
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
