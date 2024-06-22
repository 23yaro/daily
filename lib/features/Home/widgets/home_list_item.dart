import 'package:flutter/material.dart';
import 'package:daily/data_mock/list.dart';
import '../../../ui/consts/colors.dart';
import '../../../ui/consts/icons.dart';
import 'home_dismissible_wrapper.dart';

class HomeListItem extends StatefulWidget {
  const HomeListItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<HomeListItem> createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  @override
  Widget build(BuildContext context) {
    final isComplete = items[widget.index].isComplete;
    final priority = items[widget.index].priority;

    ///checkBox
    Widget checkBox = SizedBox(
      width: 22.0,
      child: Checkbox(
        activeColor: ColorsLight.green,
        value: isComplete,
        side: priority == 2 && !isComplete
            ? const BorderSide(color: ColorsLight.red, width: 2.0)
            : const BorderSide(color: ColorsLight.gray, width: 2.0),
        fillColor: priority == 2 && !isComplete
            ? MaterialStatePropertyAll(ColorsLight.red.withOpacity(0.3))
            : null,
        onChanged: (bool? bool) {
          setState(() => items[widget.index].isComplete = !isComplete);
        },
      ),
    );

    ///Дополнительная иконка, если приоритет выше 0
    ///
    ///где же вы мои if'ы из котлина ;(
    Widget? additionalIcon = (!isComplete && priority != 0)
        ? priority == 1
            ? IconsApp.arrowDown
            : priority == 2
                ? IconsApp.priorityHigh
                : null
        : null;

    ///Check box с иконкой приоритета
    ///
    ///Если есть дополнительная иконка капсулируем ее в Row
    Widget checkBoxWithAdditionalIcon = additionalIcon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              checkBox,
              SizedBox(
                  width: (priority > 0 && !isComplete) ? 6.0 : 0.0,
                  child: additionalIcon),
            ],
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              checkBox,
              SizedBox(width: (priority > 0 && !isComplete) ? 0.0 : 6.0),
            ],
          );

    ///title
    Widget title = Text(
      items[widget.index].name,
      maxLines: 2,
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      style: isComplete
          ? TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Theme.of(context).hintColor,
            )
          : null,
    );

    ///subtitle
    Widget? subtitle = (items[widget.index].date != null)
        ? Text(
            items[widget.index].date.toString(),
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14.0),
          )
        : null;
    const Widget trailing = SizedBox(width: 16.0, child: IconsApp.info);

    return DismissibleWrapper(
      child: ListTile(
        leading: checkBoxWithAdditionalIcon,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
      ),
    );
  }
}
