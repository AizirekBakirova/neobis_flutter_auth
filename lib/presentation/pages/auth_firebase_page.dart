import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/presentation/pages/auth_page.dart';
import 'package:neobis_flutter_auth/presentation/pages/home_page.dart';

class AuthFirebasePage extends StatelessWidget {
  const AuthFirebasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return AuthPage();
            }
          })),
    );
  }
}
