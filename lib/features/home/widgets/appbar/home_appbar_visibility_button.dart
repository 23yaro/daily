import 'package:daily/features/home/provider_notifiers/task_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../ui/consts/icons.dart';

class HomeVisibilityButton extends StatelessWidget {
  const HomeVisibilityButton({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<TaskListNotifier>();

    return IconButton(
      onPressed: notifier.changeVisibility,
      icon: notifier.visibility ? IconsApp.visibility : IconsApp.visibilityOff,
    );
  }
}
