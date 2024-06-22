import 'package:flutter/material.dart';

import '../../../ui/consts/icons.dart';

class HomeItemInfoButton extends StatelessWidget {
  const HomeItemInfoButton({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    void onPressed() =>
        Navigator.pushNamed(context, '/task_screen', arguments: id);
    return SizedBox(
      width: 22.0,
      height: 22.0,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: IconsApp.info,
        onPressed: onPressed,
      ),
    );
  }
}
