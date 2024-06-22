import 'package:daily/data_mock/list.dart';
import 'package:daily/features/Home/widgets/home_appbar.dart';
import 'package:daily/features/Home/widgets/home_header.dart';
import 'package:daily/features/Home/widgets/home_list.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  int stub = items.fold(
      0,
      (previousValue, element) =>
          element.isComplete ? previousValue += 1 : previousValue);

  @override
  Widget build(BuildContext context) {
    final slivers = <Widget>[
      HomeAppBar(scrollController: _scrollController),
      HomeHeader(value: stub), //Переделать
      const HomeList(),
    ];

    return CustomScrollView(controller: _scrollController, slivers: slivers);
  }
}
