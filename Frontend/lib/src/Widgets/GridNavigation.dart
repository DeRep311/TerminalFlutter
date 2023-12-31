import 'package:flutter/material.dart';

class GridNavigation extends StatelessWidget {
  final List<Widget> childrens;
  const GridNavigation({super.key, required this.childrens});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(50, 64, 0.0, 0.0),
      height: 500,
      width: 500,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(52, 52, 52, 1),
      ),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 80.0,
        crossAxisSpacing: 110.0,
        children: childrens.map((e) => e).toList()
      ),
    );
  }
}
