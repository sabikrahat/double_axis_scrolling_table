import 'package:flutter/material.dart';

class RowFixedTable extends StatelessWidget {
  const RowFixedTable({
    Key? key,
    this.height = 60.0,
    this.width = 120.0,
    required this.headerWidgets,
  }) : super(key: key);

  final double height;
  final double width;
  final List<Widget> headerWidgets;

  List<Widget> _buildHeaders() {
    return List.generate(
      headerWidgets.length,
      (index) => Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.grey[400],
              border: Border.all(color: Colors.black, width: 0.8)),
          child: headerWidgets[index]),
    );
  }

  List<Widget> _buildCells(int count) {
    return List.generate(
      count,
      (index) => Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 0.8)),
        child:
            Text("Data ${index + 1}", style: const TextStyle(fontSize: 17.0)),
      ),
    );
  }

  List<Widget> _buildRows(int count) {
    return List.generate(
      count,
      (index) => Row(
        children: _buildCells(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Row Fixed Double Scrolling Table'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildHeaders(),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildRows(20),
                ),
              ),
            ),
            // Flexible(
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     scrollDirection: Axis.vertical,
            //     itemBuilder: (context, index) => Row(
            //       children: List.generate(
            //         headerWidgets.length,
            //         (index) => Row(
            //           children: _buildCells(20),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
