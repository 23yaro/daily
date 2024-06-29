import 'package:flutter/material.dart';

import '../../../data_mock/list.dart';
import '../../../ui/consts/colors.dart';
import 'home_visibility_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 70.0, bottom: 5.0, right: 23.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Выполнено — $stub',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ColorsLight.labelTertiary),
            ),
            const HomeVisibilityButton(), //переделать как будет модель
          ],
        ),
      ),
    );
  }
}
