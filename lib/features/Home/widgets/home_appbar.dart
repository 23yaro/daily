import 'package:flutter/material.dart';
import '../../../ui/consts/icons.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool _visibility = false;

  void _changeVisibility() {
    if (widget.scrollController.offset < 75) {
      if (_visibility) {
        setState(() => _visibility = false);
      }
    } else {
      setState(() => _visibility = true);
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
      title: Padding(
        padding: const EdgeInsets.only(left: 53.0, right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Мои дела'),
            Visibility(
              visible: _visibility,
              child: IconsApp.visibility,
            ),
          ],
        ),
      ),
    );
  }
}
