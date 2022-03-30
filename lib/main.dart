import 'package:flutter/material.dart';

import 'package:double_axis_scrolling_table/column_fixed_table.dart';
import 'package:double_axis_scrolling_table/row_fixed_table.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> headers = List.generate(
      20,
      (index) =>
          Text("Header ${index + 1}", style: const TextStyle(fontSize: 17.0)));

  @override
  Widget build(BuildContext context) => DoubleScrollingTable(
        headerWidgets: headers,
        length: 20,
      );
}

class DoubleScrollingTable extends StatelessWidget {
  const DoubleScrollingTable({
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true, title: const Text('Double Scrolling Table')),
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          ElevatedButton(
              child: const Text('Column Fixed Table'),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ColumnFixedTable(
                            height: height,
                            width: width,
                            headerWidgets: headerWidgets,
                            length: length,
                          )))),
          const SizedBox(height: 20.0),
          ElevatedButton(
              child: const Text('Row Fixed Table'),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RowFixedTable(
                            height: height,
                            width: width,
                            headerWidgets: headerWidgets,
                            length: length,
                          )))),
        ])));
  }
}
