import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider_notifiers/task_notifier.dart';

class TaskTextField extends StatefulWidget {
  const TaskTextField({super.key});

  @override
  State<TaskTextField> createState() => _TaskTextFieldState();
}

class _TaskTextFieldState extends State<TaskTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<TaskNotifier>();

    void unFocus() => FocusScope.of(context).unfocus();

    void saveText(String text) => notifier.text = text;

    controller.text = notifier.text;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 15.0, right: 15.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 125),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Что надо сделать...',
                border: InputBorder.none,
              ),
              onTapOutside: (event) => unFocus(),
              onChanged: saveText,
            ),
          ),
        ),
      ),
    );
  }
}
