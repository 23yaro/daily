import 'package:daily/features/Home/widgets/home_body.dart';
import 'package:daily/features/Home/widgets/home_floating_action_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String routeName() => '/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
      floatingActionButton: FABApp(),
    );
  }
}
