import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    setState(() {
    });
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
  bool get wantKeepAlive => true;

  @override
  void visibleChanged() {
    if (kDebugMode) {
      print('$runtimeType page ${widget.index} visible $visible');
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

mixin PageVisibleUpdatedMixin<T extends StatefulWidget> on State<T> {

  bool _visible =  true;

  bool get visible => _visible;

  ValueNotifier<bool>? _tickerModeNotifier;

  @override
  void dispose() {
    _tickerModeNotifier?.removeListener(_updateTicker);
    _tickerModeNotifier = null;
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTickerModeNotifier();
  }


  @override
  void activate() {
    super.activate();
    // We may have a new TickerMode ancestor.
    _updateTickerModeNotifier();
    _updateTicker();
  }

  void _updateTicker() {
    if (_visible != _tickerModeNotifier!.value) {
      visible = _tickerModeNotifier!.value;
    }
  }

  void _updateTickerModeNotifier() {
    final ValueNotifier<bool> newNotifier = TickerMode.getNotifier(context);
    if (newNotifier == _tickerModeNotifier) {
      return;
    }
    _tickerModeNotifier?.removeListener(_updateTicker);
    newNotifier.addListener(_updateTicker);
    _tickerModeNotifier = newNotifier;
  }

  void visibleChanged();

  set visible(bool value) {
    if (value == visible) return;
    _visible = value;
    visibleChanged();
  }
}


