import 'package:flutter/material.dart';

import 'home_visibility_button.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool _visibility = false;

  void _changeVisibility() {
    ///Изменение иконки
    if (widget.scrollController.offset > 80.0 && !_visibility) {
      setState(() => _visibility = true);
    }
    if (widget.scrollController.offset < 80.0 && _visibility) {
      setState(() => _visibility = false);
    }
  }

  @override
  void initState() {
    widget.scrollController.addListener(_changeVisibility);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 69.0, bottom: 15.0),
        title: Text(
          'Мои дела',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Visibility(
            maintainState: true,
            visible: _visibility,
            child: const HomeVisibilityButton(), //переделать как будет модель
          ),
        ),
      ],
    );
  }
}
