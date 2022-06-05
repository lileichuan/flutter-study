import 'package:flutter/material.dart';
class ListWheelScrollViewDemo extends StatefulWidget {
  const ListWheelScrollViewDemo({Key? key}) : super(key: key);

  @override
  _ListWheelScrollViewDemoState createState() => _ListWheelScrollViewDemoState();
}

class _ListWheelScrollViewDemoState extends State<ListWheelScrollViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListWheelScrollView.useDelegate(itemExtent: 50, childDelegate: ListWheelChildBuilderDelegate(
        builder:(context,index){
          return Container(color: Colors.red);
        },
        childCount:100
      )),
    );
  }
}
