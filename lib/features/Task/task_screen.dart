import 'package:daily/features/Task/widgets/task_body.dart';
import 'package:flutter/material.dart';

import '../../ui/consts/icons.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int? id = ModalRoute.of(context)?.settings.arguments as int?;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context), icon: IconsApp.close),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: TextButton(
              onPressed: () {},
              child: Text('сохранить'.toUpperCase()),
            ),
          )
        ],
      ),
      body: TaskBody(id: id),
    );
  }
}
