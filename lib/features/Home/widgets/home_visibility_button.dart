import 'package:flutter/material.dart';

import '../../../ui/consts/icons.dart';

class HomeVisibilityButton extends StatefulWidget {
  const HomeVisibilityButton({super.key});

  @override
  State<HomeVisibilityButton> createState() => _HomeVisibilityButtonState();
}

class _HomeVisibilityButtonState extends State<HomeVisibilityButton> {
  bool visibility = true;

  onPressed() => setState(() => visibility = !visibility);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: visibility ? IconsApp.visibility : IconsApp.visibilityOff,
    );
  }
}
