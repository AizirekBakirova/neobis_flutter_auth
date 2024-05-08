import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/components/text_form_field.dart';
import 'package:neobis_flutter_auth/styles/app_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  hintText: 'Enter your email',
                ),
                TextFormFieldWidget(
                  hintText: 'Enter your password',
                ),
                // Text(
                //   'Lorem ipsum',
                //   style: TextStyle(color: Colors.white, fontSize: 18),
                // ),
                SizedBox(height: 70),
                SizedBox(
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black, fontSize: 23),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.elevatedButtonColor,
                        minimumSize: const Size(
                          370,
                          50,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
