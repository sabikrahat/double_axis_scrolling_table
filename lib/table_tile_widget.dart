import 'package:flutter/material.dart';

class TableTile extends StatelessWidget {
  const TableTile({
    Key? key,
    required this.outterIndex,
    required this.innerIndex,
    required this.child,
  }) : super(key: key);

  final int outterIndex;
  final int innerIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Text("${outterIndex + 1}] Data [${innerIndex + 1}",
        style: const TextStyle(fontSize: 17.0));
  }
}
