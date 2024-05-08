import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/styles/app_colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    super.key,
    required this.hintText,
  });
  final String hintText;

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: SizedBox(
          height: 100,
          child: TextFormField(
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email cannot be empty';
              } else if (value != emailController) {
                return 'Wrong email';
              }
              return null;
            },
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.textFormFieldColor,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                )),
          ),
        ),
      ),
    );
  }
}
