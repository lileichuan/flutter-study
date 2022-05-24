import 'dart:math';
import 'package:flutter/material.dart';

final GlobalKey<_GlobalWidgetState> globalKey = GlobalKey();

class GlobalWidgetDemo extends StatefulWidget {
  const GlobalWidgetDemo({Key? key}) : super(key: key);

  @override
  State<GlobalWidgetDemo> createState() => _GlobalWidgetDemoState();
}

class _GlobalWidgetDemoState extends State<GlobalWidgetDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(context){
              return  SecondPage();
            }));
          }, child: Text("进入新的页面")),
          GlobalWidget(key: globalKey)
        ],
      ),
    );
  }

}


class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(),body:GlobalWidget(key:globalKey));
  }
}

class GlobalWidget extends StatefulWidget {
  const GlobalWidget({Key? key}) : super(key: key);

  @override
  State<GlobalWidget> createState() => _GlobalWidgetState();
}

class _GlobalWidgetState extends State<GlobalWidget> {
  final _color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1.0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
      width: 100,
      height: 100,
    );
  }
}
