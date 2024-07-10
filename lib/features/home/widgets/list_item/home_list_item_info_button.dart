import 'package:daily/domain/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../ui/consts/icons.dart';
import '../../../task_edit/task_screen.dart';

class HomeItemInfoButton extends StatelessWidget {
  const HomeItemInfoButton({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    void onPressed() => context.push(TaskScreen.routeName(), extra: task);
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
