import 'package:daily/ui/consts/icons.dart';
import 'package:flutter/material.dart';

class FABapp extends StatelessWidget {
  const FABapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: FloatingActionButton(
        onPressed: () {},
        child: IconsApp.add,
      ),
    );
  }
}
