import 'package:flutter/material.dart';
import 'package:flutter_clean_arc/feature/home/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BuildHomeBody(),
    );
  }
}
