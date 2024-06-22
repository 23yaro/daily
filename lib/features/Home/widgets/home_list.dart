import 'package:flutter/material.dart';
import '../../../data_mock/list.dart';
import 'home_list_item.dart';
import 'home_list_wrapper.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    final newTask = Padding(
      padding: const EdgeInsets.only(left: 60.0, bottom: 20.0, top: 5.0),
      child: Text('Новое', style: Theme.of(context).textTheme.bodySmall),
    );

    final listItems = SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => (index != items.length)
            ? HomeListItem(index: items[index].id)
            : newTask,
        childCount: items.length + 1,
      ),
    );

    return ListWrapper(sliver: listItems);
  }
}
