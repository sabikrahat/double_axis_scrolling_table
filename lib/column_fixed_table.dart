import 'package:flutter/material.dart';

class ColumnFixedTable extends StatelessWidget {
  const ColumnFixedTable({
    Key? key,
    this.height = 60.0,
    this.width = 120.0,
    required this.headerWidgets,
    required this.length,
    this.headerBackgroundColor = Colors.grey,
  }) : super(key: key);

  final double height;
  final double width;
  final List<Widget> headerWidgets;
  final int length;
  final Color headerBackgroundColor;

  List<Widget> _buildHeaders() => List.generate(
      headerWidgets.length,
      (index) => Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: headerBackgroundColor,
              border: Border.all(color: Colors.black, width: 0.8)),
          child: headerWidgets[index]));

  List<Widget> _buildData() => List.generate(
      headerWidgets.length,
      (outterIndex) => Row(
          children: List.generate(
              length,
              (innerIndex) => Container(
                  alignment: Alignment.center,
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 0.8)),
                  child: Text("${outterIndex + 1}] Data [${innerIndex + 1}",
                      style: const TextStyle(fontSize: 17.0))))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Column Fixed Double Scrolling Table'),
      ),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildHeaders(),
            ),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildData(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
