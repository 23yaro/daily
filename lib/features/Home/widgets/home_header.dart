import 'package:daily/ui/consts/icons.dart';
import 'package:flutter/material.dart';

import '../../../data_mock/list.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 70.0, bottom: 20.0, right: 26.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Выполнено — $stub'),
            IconsApp.visibility,
          ],
        ),
      ),
    );
  }
}
