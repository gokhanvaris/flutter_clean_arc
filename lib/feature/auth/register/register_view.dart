import 'package:flutter/material.dart';
import 'package:flutter_clean_arc/feature/auth/register/widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BuildRegisterBody(),
    );
  }
}
