import 'package:flutter/material.dart';

class InheritedWidgetDemo extends StatefulWidget {
  const InheritedWidgetDemo({Key? key}) : super(key: key);

  static MyInheritedData? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()?.data;
  }
  @override
  State<InheritedWidgetDemo> createState() => _InheritedWidgetDemoState();
}

class _InheritedWidgetDemoState extends State<InheritedWidgetDemo> {
  var _number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  MyInheritedWidget(child:Column(
        children: [
          const MyInheritedWidgetText(),
          const MyInheritedWidgetChild(),
          const MyInheritedWidgetChild(),
          TextButton(onPressed: (){
            setState(() {
              _number++;
            });
          }, child: Text('刷新数据'))
        ],
      ) , data: MyInheritedData('$_number'))
    );
  }
}


class MyInheritedWidgetText extends StatelessWidget {
  const MyInheritedWidgetText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(InheritedWidgetDemo.of(context)?.text??"获取失败");
  }
}

class MyInheritedWidgetChild extends StatefulWidget {
  const MyInheritedWidgetChild({Key? key}) : super(key: key);

  @override
  State<MyInheritedWidgetChild> createState() => _MyInheritedWidgetChildState();
}

class _MyInheritedWidgetChildState extends State<MyInheritedWidgetChild> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Text(InheritedWidgetDemo.of(context)?.text??"获取失败");
  }
}



class MyInheritedWidget extends InheritedWidget{
  final MyInheritedData data;
  const MyInheritedWidget({Key? key,required Widget child,required this.data}) : super(key: key,child: child);

  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) => oldWidget.data != data;

}

class MyInheritedData{
  final String text;
  const MyInheritedData(this.text);
}