import 'package:flutter/material.dart';

import '../../../../ui/consts/colors.dart';
import '../../../../ui/consts/icons.dart';

class DismissibleWrapper extends StatelessWidget {
  const DismissibleWrapper({
    super.key,
    required this.id,
    required this.child,
    required this.startToEnd,
    required this.endToStart,
  });

  final String id;
  final Widget child;
  final VoidCallback startToEnd;
  final VoidCallback endToStart;

  @override
  Widget build(BuildContext context) {
    //CountLog.count('item rebuild');
    Future<bool> confirmDismiss(DismissDirection direction) async {
      if (direction == DismissDirection.startToEnd) {
        startToEnd();
        return false;
      } else if (direction == DismissDirection.endToStart) {
        endToStart();
        return true;
      }
      return false;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Dismissible(
        confirmDismiss: confirmDismiss,
        key: ValueKey(id),
        background: Container(
          alignment: Alignment.centerLeft,
          color: ColorsApp.green,
          child: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: IconsApp.check,
          ),
        ),
        secondaryBackground: Container(
          alignment: Alignment.centerRight,
          color: ColorsApp.red,
          child: const Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: IconsApp.deleteDef,
          ),
        ),
        child: child,
      ),
    );
  }
}
