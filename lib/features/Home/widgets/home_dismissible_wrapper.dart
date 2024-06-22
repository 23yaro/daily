import 'package:flutter/material.dart';
import '../../../ui/consts/colors.dart';
import '../../../ui/consts/icons.dart';

class DismissibleWrapper extends StatelessWidget {
  const DismissibleWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    void onDismissed(direction){
      //if(direction == DismissDirection.startToEnd)
      //if(direction == DismissDirection.endToStart)
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Dismissible(
        onDismissed: onDismissed,
        key: UniqueKey(),
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
            child: IconsApp.delete,
          ),
        ),
        child: child,
      ),
    );
  }
}