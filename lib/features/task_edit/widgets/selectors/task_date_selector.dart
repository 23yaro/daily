import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../ui/consts/colors.dart';
import '../../../../utils/formatters/formatters.dart';
import '../../../../utils/s/s.dart';
import '../../provider_notifiers/task_notifier.dart';

class TaskDateSelector extends StatelessWidget {
  const TaskDateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<TaskNotifier>();

    Future<void> selectDate(BuildContext context) async {
      final DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 5),
        locale: S.locale,
        builder: (context, child) => Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSeed(seedColor: ColorsApp.blue),
            ),
            child: child!),
      );
      if (date != null) {
        notifier.deadline = date;
      }
    }

    onChanged(bool newValue, BuildContext context) {
      if (!newValue) {
        notifier.deadline = null;
      } else {
        selectDate(context);
      }
    }

    return ListTile(
      title: Text(S.of(context).taskDeadline),
      subtitle: notifier.task.hasDeadline
          ? Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                child: TextButton(
                  style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () => selectDate(context),
                  child: Text(Formatters.convertDateTimeToString(notifier.deadline!)),
                ),
              ),
            )
          : null,
      trailing: Switch(
        value: notifier.task.hasDeadline,
        onChanged: (newValue) => onChanged(newValue, context),
      ),
    );
  }
}
