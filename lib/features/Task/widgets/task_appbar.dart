import 'package:flutter/material.dart';

import '../../../ui/consts/icons.dart';

class TaskAppBar extends StatelessWidget {
  const TaskAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      leading: IconButton(
          onPressed: () => Navigator.pop(context), icon: IconsApp.close),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: TextButton(
            onPressed: () {},
            child: Text('сохранить'.toUpperCase()),
          ),
        )
      ],
    );
  }
}
