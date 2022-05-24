import 'package:flutter/material.dart';

class HeroDemo extends StatefulWidget {
  const HeroDemo({Key? key}) : super(key: key);

  @override
  State<HeroDemo> createState() => _HeroDemoState();
}

class _HeroDemoState extends State<HeroDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //一排两个
                crossAxisSpacing: 10, //间距
                mainAxisSpacing: 10, //间距
                childAspectRatio: 16 / 9),
            children: List.generate(20, (index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return HeroDetailPage(index: index);
                    }));
                  },
                  child: Hero(
                      tag: '$index',
                      child: Container(
                          color: Colors.red,
                          child: Text('$index'),
                          alignment: Alignment.center)));
            })));
  }
}


class HeroDetailPage extends StatefulWidget {
  final int index;
  const HeroDetailPage({Key? key,required this.index}) : super(key: key);

  @override
  State<HeroDetailPage> createState() => _HeroDetailPageState();
}

class _HeroDetailPageState extends State<HeroDetailPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          child: Hero(tag: '${widget.index}', child:Container(
            alignment: Alignment.center,
            color: Colors.red,
            width: 100,
            height: 100,
            child: Text("${widget.index}"),
          )),
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
