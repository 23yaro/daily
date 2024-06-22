import 'package:daily/ui/consts/colors.dart';
import 'package:flutter/material.dart';

abstract class CheckBoxes {
  static Widget priorityDef(bool isComplete, Function(bool?) onChanged) {
    return Checkbox(
      value: isComplete,
      onChanged: onChanged,
      activeColor: ColorsLight.green,
    );
  }

  static Widget priorityHigh(bool isComplete, Function(bool?) onChanged) {
    return Checkbox(
      value: isComplete,
      onChanged: onChanged,
      activeColor: ColorsLight.green,
      side: !isComplete ? const BorderSide(color: ColorsLight.red) : null,
      fillColor: !isComplete
          ? MaterialStatePropertyAll(ColorsLight.red.withOpacity(0.3))
          : null,
    );
  }
}
