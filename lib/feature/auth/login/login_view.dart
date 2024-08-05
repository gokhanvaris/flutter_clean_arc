import 'package:flutter/material.dart';
import 'package:flutter_clean_arc/feature/auth/login/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BuildLoginBody(),
    );
  }
}
