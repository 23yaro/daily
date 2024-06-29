import 'package:daily/features/Home/widgets/list/home_list.dart';
import 'package:flutter/material.dart';

import 'appbar/home_appbar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    const slivers = <Widget>[
      HomeAppBar(),
      HomeList(),
    ];

    return const CustomScrollView(slivers: slivers);
  }
}
