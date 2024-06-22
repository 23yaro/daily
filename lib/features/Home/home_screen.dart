import 'package:daily/features/Home/widgets/home_body.dart';
import 'package:daily/features/Home/widgets/home_floatingActionButton.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
      floatingActionButton: FABapp(),
    );
  }
}
