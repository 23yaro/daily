import 'package:daily/ui/consts/colors.dart';
import 'package:flutter/material.dart';

abstract class IconsApp {
  static const check = Icon(
    Icons.check,
    color: ColorsLight.white,
  );
  static const priorityLow = Icon(
    Icons.arrow_drop_down_outlined,
    color: ColorsLight.labelTertiary,
  );
  static const priorityHigh = Icon(
    Icons.priority_high_outlined,
    color: ColorsLight.red,
  );
  static const visibility = Icon(
    Icons.visibility,
    color: ColorsLight.blue,
  );
  static const visibilityOff = Icon(
    Icons.visibility_off,
    color: ColorsLight.blue,
  );
  static const add = Icon(
    Icons.add,
    color: ColorsLight.white,
  );
  static const delete = Icon(
    Icons.delete,
    color: ColorsLight.white,
  );
  static const info = Icon(
    Icons.info_outline,
    color: ColorsLight.gray,
  );
  static const close = Icon(
    Icons.close,
  );
}
