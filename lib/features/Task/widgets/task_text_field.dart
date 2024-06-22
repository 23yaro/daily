import 'package:daily/data_mock/list.dart';
import 'package:flutter/material.dart';

class TaskTextField extends StatefulWidget {
  const TaskTextField({super.key});

  @override
  State<TaskTextField> createState() => _TaskTextFieldState();
}

class _TaskTextFieldState extends State<TaskTextField> {
  unFocus() => FocusScope.of(context).unfocus();
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int? id = ModalRoute.of(context)?.settings.arguments as int?;
    controller.text = id == null ? '' : items[id].name;

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
              onSubmitted: (event) => unFocus(),
            ),
          ),
        ),
      ),
    );
  }
}
