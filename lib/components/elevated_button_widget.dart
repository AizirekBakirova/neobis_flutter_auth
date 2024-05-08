import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/styles/app_colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.elevatedButtonColor,
            minimumSize: const Size(
              370,
              50,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        child: const Text(
          'Sign In',
          style: TextStyle(color: Colors.black, fontSize: 23),
        ),
      ),
    );
  }
}
