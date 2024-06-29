import 'package:flutter/material.dart';

import '../../../ui/consts/colors.dart';

class TaskPrioritySelector extends StatefulWidget {
  const TaskPrioritySelector({super.key});

  @override
  State<TaskPrioritySelector> createState() => _TaskPrioritySelectorState();
}

class _TaskPrioritySelectorState extends State<TaskPrioritySelector> {
  final items = const [
    DropdownMenuItem<String>(
      value: 'Нет',
      child: Text(
        'Нет',
      ),
    ),
    DropdownMenuItem<String>(
      value: 'Низкий',
      child: Text(
        'Низкий',
        style: TextStyle(color: ColorsLight.labelPrimary),
      ),
    ),
    DropdownMenuItem<String>(
      value: '!! Высокий',
      child: Text(
        '!! Высокий',
        style: TextStyle(color: ColorsLight.red),
      ),
    ),
  ];

  final divider = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Container(
      height: 1.0,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFBDBDBD),
          ),
        ),
      ),
    ),
  );

  String? value = 'Нет';

  onChanged(newValue) => setState(() => value = newValue);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: const Text('Важность'),
          subtitle: Align(
            alignment: Alignment.centerLeft,
            child: DropdownButton(
              underline: const SizedBox(),
              style: Theme.of(context).textTheme.bodySmall,
              icon: const Icon(null),
              value: value,
              items: items,
              onChanged: onChanged,
            ),
          ),
        ),
        divider,
      ],
    );
  }
}
