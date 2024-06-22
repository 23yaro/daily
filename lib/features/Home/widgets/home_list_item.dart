import 'package:daily/data_mock/list.dart';
import 'package:flutter/material.dart';

import '../../../ui/check_boxes/check_box.dart';
import '../../../ui/consts/icons.dart';
import 'home_dismissible_wrapper.dart';
import 'home_item_info_button.dart';

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
  void onChanged(bool? bool) => setState(
      () => items[widget.index].isComplete = !items[widget.index].isComplete);

  @override
  Widget build(BuildContext context) {
    final isComplete = items[widget.index].isComplete;

    final priority = items[widget.index].priority;

    final titleTextStyle = TextStyle(
      decoration: TextDecoration.lineThrough,
      color: Theme.of(context).hintColor,
    );

    final subTitleTextStyle =
        Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14.0);

    ///checkBox
    Widget? checkBox;
    switch (priority) {
      case 2:
        checkBox = CheckBoxes.priorityHigh(isComplete, onChanged);
      default:
        checkBox = CheckBoxes.priorityDef(isComplete, onChanged);
    }

    ///Дополнительная иконка приоритета
    Widget? additionalIcon;
    if (!isComplete) {
      switch (priority) {
        case 1:
          additionalIcon = IconsApp.priorityLow;
        case 2:
          additionalIcon = IconsApp.priorityHigh;
      }
    }

    ///leading
    ///
    ///Check box с иконкой приоритета
    Widget checkBoxWithAdditionalIcon = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 22.0, child: checkBox),
        SizedBox(width: 6.0, child: additionalIcon),
      ],
    );

    ///title
    Widget title = Text(
      items[widget.index].name,
      maxLines: 2,
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      style: isComplete ? titleTextStyle : null,
    );

    ///subtitle
    Widget? subtitle = (items[widget.index].date != null)
        ? Text(
            items[widget.index].date.toString(),
            style: subTitleTextStyle,
          )
        : null;

    return DismissibleWrapper(
      id: widget.index,
      child: ListTile(
        leading: checkBoxWithAdditionalIcon,
        title: title,
        subtitle: subtitle,
        trailing: HomeItemInfoButton(id: widget.index),
      ),
    );
  }
}
