import 'package:daily/features/home/provider_notifiers/task_list_notifier.dart';
import 'package:daily/utils/extensions/date_formatter.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/model/task_model.dart';
import '../../../../ui/consts/icons.dart';
import 'home_list_item_check_box.dart';
import 'home_list_item_dismissible_wrapper.dart';
import 'home_list_item_info_button.dart';

class HomeListItem extends StatelessWidget {
  const HomeListItem({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<TaskListNotifier>();

    Future<void> completeTask() async {
      await notifier.updateTask(task..complete());
      FirebaseAnalytics.instance.logEvent(name: "complete_task");
    }

    final completableTextStyle = task.done
        ? TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Theme.of(context).hintColor,
          )
        : null;

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
          child: task.done ? null : IconsApp.importancies[task.importance],
        ),
      ],
    );

    ///title
    Widget title = Text(
      task.text,
      maxLines: 2,
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      style: completableTextStyle,
    );

    ///subtitle
    Widget? subtitle = task.hasDeadline
        ? Text(
            task.deadline!.convertDateTimeToString(),
            style: completableTextStyle,
          )
        : null;

    return DismissibleWrapper(
      task: task,
      child: ListTile(
        leading: checkBoxWithAdditionalIcon,
        title: title,
        subtitle: subtitle,
        trailing: HomeItemInfoButton(task: task),
      ),
    );
  }
}
