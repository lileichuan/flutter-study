import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'page_visible_updated.dart';
import 'page_view_observer.dart';
class PageViewDemo extends StatefulWidget {
  const PageViewDemo({Key? key}) : super(key: key);

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> with PageVisibleUpdatedMixin{

  var _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:PageViewObserver(
        initialPage:visible?_index:-1,
        child:PageView(
          onPageChanged:(index){
            _index = index;
            if (kDebugMode) {
              print("index is $index");
            }
          },
          children: const [
            PageItem(index: 0),
            PageItem(index: 1),
            PageItem(index: 2),
            PageItem(index: 3),
          ],
        ),
      )
    );
  }

  @override
  void visibleChanged() {
    if (kDebugMode) {
      print('$runtimeType page visible $visible');
    }
    // setState(() {
    // });
  }
}


class PageItem extends StatefulWidget {
  final int index;
  const PageItem({Key? key, required this.index}) : super(key: key);

  @override
  State<PageItem> createState() => _PageItemState();
}

class _PageItemState extends State<PageItem> with AutomaticKeepAliveClientMixin,PageVisibleUpdatedMixin,PageViewObserverMixin{
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print("${widget.index} initState");
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (kDebugMode) {
      print("${widget.index} didChangeDependencies");
    }
  }

  @override
  void didUpdateWidget(covariant PageItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (kDebugMode) {
      print("${widget.index} didUpdateWidget");
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    if (kDebugMode) {
      print("${widget.index} deactivate");
    }
    // _ticker.stop();
  }

  @override
  void dispose() {
    if (kDebugMode) {
      print("${widget.index} dispose");
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(child: TextButton(
      onPressed:(){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){return const PageDetail();}));
      },
      child: Text("我是第${widget.index}页,点击进入详情"),
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;

  @override
  void visibleChanged() {
    if (kDebugMode) {
      print('$runtimeType page ${widget.index} visible $visible');
    }
  }

  @override
  void leaveChanged(){
    if (kDebugMode) {
      print('$runtimeType page ${widget.index} leave $leave');
    }
  }
}


class PageDetail extends StatefulWidget {
  const PageDetail({Key? key}) : super(key: key);

  @override
  State<PageDetail> createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:const Text('详情页')),body:const Center(child:Text('详情页')));
  }
}




