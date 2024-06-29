import 'package:flutter/material.dart';

import '../../../ui/consts/colors.dart';

class TaskDateSelector extends StatefulWidget {
  const TaskDateSelector({super.key});

  @override
  State<TaskDateSelector> createState() => _TaskDateSelectorState();
}

class _TaskDateSelectorState extends State<TaskDateSelector> {
  bool _value = false;
  String _date = 'дата';
  final _divider = Padding(
    padding: const EdgeInsets.only(top: 40.0),
    child: Container(
      height: 1.0,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFBDBDBD),
          ),
        ),
      ),
    ),
  );

  Future<void> _selectDate(BuildContext context) async {
    if (!_value) return;
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
      locale: const Locale("ru", "RU"),
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSeed(seedColor: ColorsLight.blue)),
          child: child!),
    );
    if (date != null) {
      setState(() {
        _date = '${date.day} ${date.month} ${date.year}';
      });
    }
  }

  onChanged(bool newValue, BuildContext context) {
    if (!newValue) _date = 'дата';
    setState(() {
      _value = newValue;
      _selectDate(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Сделать до'),
          subtitle: _value
              ? Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () => _selectDate(context),
                      child: Text(_date),
                    ),
                  ),
                )
              : null,
          trailing: Switch(
            value: _value,
            onChanged: (newValue) => onChanged(newValue, context),
          ),
        ),
        _divider,
      ],
    );
  }
}
