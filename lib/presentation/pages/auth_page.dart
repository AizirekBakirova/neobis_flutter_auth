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
                const TextFormFieldWidget(
                  hintText: 'Email',
                ),
                const TextFormFieldWidget(
                  hintText: 'Password',
                ),
                const Text(
                  'Lorem ipsum',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 70),
                const ElevatedButtonWidget(),
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const RegisterPage())));
                      },
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
    );
  }
}
