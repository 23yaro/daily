import 'package:flutter/material.dart';

import '../../../data_mock/list.dart';
import 'home_list_item.dart';
import 'home_list_wrapper.dart';
import 'home_new_task_button.dart';

class HomeList extends StatefulWidget {
  const HomeList({super.key});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    final listItems = SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => (index != items.length)
            ? HomeListItem(index: items[index].id)
            : const HomeNewTaskButton(),
        childCount: items.length + 1,
      ),
    );

    return ListWrapper(sliver: listItems);
  }
}
