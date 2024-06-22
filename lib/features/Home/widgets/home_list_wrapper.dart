import 'package:flutter/material.dart';

class ListWrapper extends StatelessWidget {
  const ListWrapper({super.key, required this.sliver});

  final Widget sliver;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 25.0),
      sliver: DecoratedSliver(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 0.5,
            ),
          ],
        ),
        sliver: sliver,
      ),
    );
  }
}
