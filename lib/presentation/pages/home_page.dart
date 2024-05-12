import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/styles/app_colors.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void _signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        actions: [
          IconButton(onPressed: _signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
          child: Text(
        'WELCOME ${user.email!}',
        style: const TextStyle(fontSize: 20),
      )),
    );
  }
}
