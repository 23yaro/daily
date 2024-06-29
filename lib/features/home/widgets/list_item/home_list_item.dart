import 'package:daily/features/home/provider_notifiers/task_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../ui/consts/icons.dart';
import 'home_list_item_check_box.dart';
import 'home_list_item_dismissible_wrapper.dart';
import 'home_list_item_info_button.dart';

class HomeListItem extends StatelessWidget {
  const HomeListItem({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<TaskListNotifier>();

    final task = notifier.tasks.firstWhere((e) => e.id == id);

    final titleTextStyle = TextStyle(
      decoration: TextDecoration.lineThrough,
      color: Theme.of(context).hintColor,
    );

    final subTitleTextStyle =
        Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14.0);

    void completeTask() async => await notifier.updateTask(task..complete());

    void deleteTask() async => await notifier.deleteTask(task.id);

    ///checkBox
    Widget checkBox = CheckBoxApp(
      isComplete: task.done,
      onChanged: completeTask,
      importance: task.importance,
    );

    ///leading
    ///
    ///Check box с иконкой приоритета
    Widget checkBoxWithAdditionalIcon = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 22.0, child: checkBox),
        SizedBox(
          width: 6.0,
          child: IconsApp.importancies[task.importance],
        ),
      ],
    );

    ///title
    Widget title = Text(
      task.text,
      maxLines: 2,
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      style: task.done ? titleTextStyle : null,
    );

    ///subtitle
    Widget? subtitle;
    if (task.deadline != null) {
      subtitle = Text(
        task.deadline!,
        style: subTitleTextStyle,
      );
    }

    return DismissibleWrapper(
      id: id,
      startToEnd: completeTask,
      endToStart: deleteTask,
      child: ListTile(
        leading: checkBoxWithAdditionalIcon,
        title: title,
        subtitle: subtitle,
        trailing: HomeItemInfoButton(id: id),
      ),
    );
  }
}