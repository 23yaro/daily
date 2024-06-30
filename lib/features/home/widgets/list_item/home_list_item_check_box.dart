import 'package:daily/domain/model/task_model.dart';
import 'package:daily/ui/consts/colors.dart';
import 'package:flutter/material.dart';

class CheckBoxApp extends StatelessWidget {
  const CheckBoxApp({
    super.key,
    required this.importance,
    required this.isComplete,
    required this.onChanged,
  });

  final Importance importance;
  final bool isComplete;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    onChanged(bool? isComplete) => this.onChanged();
    switch (importance) {
      case Importance.high:
        return CheckBoxAppHighPriority(
          isComplete: isComplete,
          onChanged: onChanged,
        );
      default:
        return Checkbox(
          value: isComplete,
          onChanged: onChanged,
          activeColor: ColorsApp.green,
        );
    }
  }
}

class CheckBoxAppHighPriority extends StatelessWidget {
  const CheckBoxAppHighPriority({
    super.key,
    required this.isComplete,
    required this.onChanged,
  });

  final bool isComplete;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isComplete,
      onChanged: onChanged,
      activeColor: ColorsApp.green,
      side: !isComplete ? const BorderSide(color: ColorsApp.red) : null,
      fillColor: !isComplete
          ? WidgetStatePropertyAll(ColorsApp.red.withOpacity(0.3))
          : null,
    );
  }
}
