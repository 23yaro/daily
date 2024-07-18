import 'package:daily/features/home/widgets/list/home_list_body.dart';
import 'package:flutter/material.dart';

import 'appbar/home_appbar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    const slivers = <Widget>[
      HomeAppBar(),
      HomeBodyList(),
    ];

    return const CustomScrollView(slivers: slivers);
  }
}
