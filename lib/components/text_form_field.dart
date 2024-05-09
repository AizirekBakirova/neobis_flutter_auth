import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/styles/app_colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    super.key,
    required this.hintText,
    this.controller,
    required this.obscureText,
    this.validator,
    this.suffixIcon,
  });
  final dynamic controller;
  final bool obscureText;
  final String hintText;
  final dynamic validator;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: SizedBox(
        height: 100,
        child: TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
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
    );
  }
}
