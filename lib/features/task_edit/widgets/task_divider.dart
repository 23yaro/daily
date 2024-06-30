import 'package:flutter/material.dart';

import '../../../ui/consts/colors.dart';

class TaskDivider extends StatelessWidget {
  const TaskDivider({super.key, required this.padding});

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: 1.0,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorsApp.separator,
          ),
        ),
      ),
    );
  }
}
