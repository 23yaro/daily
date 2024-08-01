import 'package:daily/features/home/provider_notifiers/task_list_notifier.dart';
import 'package:daily/features/home/widgets/appbar/home_appbar_visibility_button.dart';
import 'package:daily/utils/environment_variables/environment_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/s/s.dart';
import 'home_appbar_dev_shield.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _HomeSliverAppBar(
        expandedHeight: 148,
        collapsedHeight: 88,
      ),
    );
  }
}

class _HomeSliverAppBar extends SliverPersistentHeaderDelegate {
  _HomeSliverAppBar({
    required this.expandedHeight,
    required this.collapsedHeight,
  });

  final double expandedHeight;
  final double collapsedHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final completedText = context.strings().homeAppBarSubTitle;

    final countOfCompletedTasks = context
        .watch<TaskListNotifier>()
        .tasks
        .where((task) => task.done)
        .length;

    final subTitleText = '$completedText $countOfCompletedTasks';

    const devShield = EnvironmentVariables.appVersion == 'DEV'
        ? Positioned(
            right: 68,
            bottom: 14,
            child: HomeAppbarDevShield(),
          )
        : SizedBox();

    return Stack(
      fit: StackFit.expand,
      children: [
        AppBar(),
        Positioned(
          bottom: (46 - shrinkOffset).clamp(16, 46),
          left: (70 - shrinkOffset).clamp(26, 70),
          child: Text(
            context.strings().homeAppBarTitle,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: (32 - shrinkOffset / 3).clamp(20, 32),
                ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 70,
              bottom: 16,
            ),
            child: Opacity(
              opacity: (1 - shrinkOffset / 20).clamp(0, 1),
              child: Text(
                subTitleText,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
            ),
          ),
        ),
        const Positioned(
          right: 20,
          bottom: 0,
          child: HomeVisibilityButton(),
        ),
        devShield,
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => collapsedHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
