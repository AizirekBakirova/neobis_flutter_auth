import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/components/text_form_field.dart';
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
        body: Center(
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
                hintText: 'Username',
              ),
              TextFormFieldWidget(
                hintText: 'Password',
              ),
              Text(
                'Lorem ipsum',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 70),
              SizedBox(
                height: 70,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Sign In',
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
              SizedBox(height: 15),
              Text(
                'Lorem ipsum',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
