import 'package:flutter/material.dart';
import 'package:flutter_demos/02/global_widget.dart';
import 'package:flutter_demos/02/hero_widget.dart';
import 'package:flutter_demos/02/inhirited_widget.dart';
import 'package:flutter_demos/04_custom_scroll_view.dart';
import '';
import '01/render_object_widget.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const FzRenderObjectWidget(),
            const SizedBox(
              width: 500,
              height:50,
            ),
            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return  const GlobalWidgetDemo();
              }));
            }, child: const Text('Global Widget demo')),
            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return  const HeroDemo();
              }));
            }, child: const Text('Hero Widget demo')),
            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return  const CustomScrollViewDemo();
              }));
            }, child: const Text('custom scrollview demo')),
            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return  const InheritedWidgetDemo();
              }));
            }, child: const Text('inherited widget demo'))
          ],
        ),
      ),
    );
  }
}
