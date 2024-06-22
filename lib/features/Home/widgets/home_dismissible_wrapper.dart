import 'package:flutter/material.dart';

import '../../../ui/consts/colors.dart';
import '../../../ui/consts/icons.dart';

class DismissibleWrapper extends StatelessWidget {
  const DismissibleWrapper({super.key, required this.child, required this.id});

  final Widget child;
  final int id;

  @override
  Widget build(BuildContext context) {
    void onDismissed(direction) {
      //if(direction == DismissDirection.startToEnd)
      //if(direction == DismissDirection.endToStart)
    }

    Future<bool> confirmDismiss(dis) async => false;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Dismissible(
        confirmDismiss: confirmDismiss,
        onDismissed: onDismissed,
        key: ValueKey(id),
        background: Container(
          alignment: Alignment.centerLeft,
          color: ColorsLight.green,
          child: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: IconsApp.check,
          ),
        ),
        secondaryBackground: Container(
          alignment: Alignment.centerRight,
          color: ColorsLight.red,
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
