import 'package:flutter/material.dart';

import '../../../ui/consts/colors.dart';
import '../../../ui/consts/icons.dart';

class TaskDeleteButton extends StatelessWidget {
  const TaskDeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    int? id = ModalRoute.of(context)?.settings.arguments as int?;

    final icon = id == null ? IconsApp.deleteDisabled : IconsApp.delete;

    onPressed() {
      return;
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: id == null ? null : onPressed,
        style: TextButton.styleFrom(foregroundColor: ColorsLight.red),
        icon: icon,
        label: const Text('Удалить'),
      ),
    );
  }
}
