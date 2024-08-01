import 'package:flutter/material.dart';

import '../../../../ui/consts/colors.dart';

class HomeAppbarDevShield extends StatelessWidget {
  const HomeAppbarDevShield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: ColorsApp.devShieldColor,
      ),
      child: const Text(
        'DEV',
        style: TextStyle(
          color: ColorsApp.white,
        ),
      ),
    );
  }
}
