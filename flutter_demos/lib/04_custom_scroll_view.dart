import 'package:flutter/material.dart';
class CustomScrollViewDemo extends StatefulWidget {
  const CustomScrollViewDemo({Key? key}) : super(key: key);

  @override
  State<CustomScrollViewDemo> createState() => _CustomScrollViewDemoState();
}

class _CustomScrollViewDemoState extends State<CustomScrollViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: NestedScrollView(
        floatHeaderSlivers:true,
        headerSliverBuilder:(context,innerBoxIsScrolled){
          return [
            SliverAppBar(title:Text('滑动列表'),pinned: true,),
            SliverToBoxAdapter(child:  Container(height: 100,color: Colors.red)),
            SliverToBoxAdapter(child:  Container(height: 100,color: Colors.orange))
          ];
        },
        body: Container(
          height: 500,
          color: Colors.black,
        ),

      ),
      // body: CustomScrollView(
      //   anchor: 0.1,
      //   slivers: [
      //     SliverToBoxAdapter(
      //       child:Container(color:Colors.red,height: 100,),
      //     ),
      //     SliverList(delegate: SliverChildBuilderDelegate((context, index){
      //       return Text('$index');
      //     },childCount:100))
      //   ],
      // ),
    );
  }
}

