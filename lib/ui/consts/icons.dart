import 'package:daily/domain/model/task_model.dart';
import 'package:daily/ui/consts/colors.dart';
import 'package:flutter/material.dart';

abstract class IconsApp {
  static const check = Icon(
    Icons.check,
    color: ColorsApp.white,
  );
  static const priorityLow = Icon(
    Icons.arrow_drop_down_outlined,
    color: ColorsApp.gray,
  );
  static const priorityHigh = Icon(
    Icons.priority_high_outlined,
    color: ColorsApp.red,
  );
  static const visibility = Icon(
    Icons.visibility,
    color: ColorsApp.blue,
  );
  static const visibilityOff = Icon(
    Icons.visibility_off,
    color: ColorsApp.blue,
  );
  static const add = Icon(
    Icons.add,
    color: ColorsApp.white,
  );
  static const deleteDef = Icon(
    Icons.delete,
    color: ColorsApp.white,
  );
  static const delete = Icon(
    Icons.delete,
    color: ColorsApp.red,
  );
  static const deleteDisabled = Icon(
    Icons.delete,
    color: ColorsApp.labelDisable,
  );
  static const info = Icon(
    Icons.info_outline,
    color: ColorsApp.gray,
  );
  static const close = Icon(
    Icons.close,
  );

  static const Map<Importance, Icon> importancies = {
    Importance.none: Icon(null),
    Importance.low: priorityLow,
    Importance.high: priorityHigh,
  };
}
