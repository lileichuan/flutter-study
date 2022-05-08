import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class PageViewDemo extends StatefulWidget {
  const PageViewDemo({Key? key}) : super(key: key);

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:PageView(
        children: const [
          WrapPageView(child: PageItem(index: 0)),
          WrapPageView(child: PageItem(index: 1)),
          WrapPageView(child: PageItem(index: 2)),
          WrapPageView(child: PageItem(index: 3)),
        ],
      ),
    );
  }
}


class WrapPageView extends StatefulWidget {
  final Widget child;
  const WrapPageView({Key? key,required this.child}) : super(key: key);

  @override
  State<WrapPageView> createState() => _WrapPageViewState();
}

class _WrapPageViewState extends State<WrapPageView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (kDebugMode) {
      print("WrapPageView didChangeDependencies");
    }
  }

  @override
  void didUpdateWidget(covariant WrapPageView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (kDebugMode) {
      print("WrapPageView didUpdateWidget");
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    if (kDebugMode) {
      print("WrapPageView deactivate");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("WrapPageView build");
    }
    return widget.child;
  }
}


class PageItem extends StatefulWidget {
  final int index;
  const PageItem({Key? key, required this.index}) : super(key: key);

  @override
  State<PageItem> createState() => _PageItemState();
}

class _PageItemState extends State<PageItem> with AutomaticKeepAliveClientMixin{
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
    if (kDebugMode) {
      print("${widget.index} build");
    }
    return Center(child: Text("我是第${widget.index}页"));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
