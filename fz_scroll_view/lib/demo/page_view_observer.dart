import 'package:flutter/material.dart';
class PageViewObserver extends StatefulWidget {
  final int initialPage;
  final Widget child;
  const  PageViewObserver({Key? key,this.initialPage = 0,required this.child}) : super(key: key);

  static ValueNotifier<int> getNotifier(BuildContext context) {
    final _EffectivePageViewObserver? widget = context.getElementForInheritedWidgetOfExactType<_EffectivePageViewObserver>()?.widget as _EffectivePageViewObserver?;
    return widget?.notifier ?? ValueNotifier<int>(0);
  }


  @override
  State<PageViewObserver> createState() => _PageViewObserverState();
}

class _PageViewObserverState extends State< PageViewObserver> {
  final ValueNotifier<int> _effectivePageViewObserver= ValueNotifier<int>(0);
  int _lastReportedPage = 0;
  _onPageChanged(int currentPage){
    _effectivePageViewObserver.value = currentPage;
  }

  @override
  void initState() {
    super.initState();
    if( _lastReportedPage != widget.initialPage){
      _lastReportedPage = widget.initialPage;
      _onPageChanged(_lastReportedPage);
    }
  }

  @override
  void didUpdateWidget(covariant PageViewObserver oldWidget) {
    super.didUpdateWidget(oldWidget);
    if( _lastReportedPage != widget.initialPage){
      _lastReportedPage = widget.initialPage;
      _onPageChanged(_lastReportedPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification.depth == 0 && notification is ScrollUpdateNotification) {
          final PageMetrics metrics = notification.metrics as PageMetrics;
          final int currentPage = metrics.page!.round();
          if (currentPage != _lastReportedPage) {
            _lastReportedPage = currentPage;
            _onPageChanged(currentPage);
          }
        }
        return false;
      },
      child:_EffectivePageViewObserver(
      child:widget.child,
      notifier: _effectivePageViewObserver,
    )
    );
  }
}

class _EffectivePageViewObserver extends InheritedWidget {
  const _EffectivePageViewObserver({
    Key? key,
    required this.notifier,
    required Widget child,
  }) : super(key: key, child: child);

  final ValueNotifier<int> notifier;

  @override
  bool updateShouldNotify(_EffectivePageViewObserver oldWidget) => notifier.value != oldWidget.notifier.value;

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  // }
}


mixin PageViewObserverMixin<T extends StatefulWidget> on State<T> {

  bool _leave = false;

  bool get leave => _leave;

  ValueNotifier<int>? _pageViewChangedNotifier;

  IndexedSemantics? _indexedSemantics;



  @override
  void dispose() {
    _pageViewChangedNotifier?.removeListener(_pageViewChanged);
    _pageViewChangedNotifier = null;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updatePageViewChangedNotifier();
    _indexedSemantics = context.findAncestorWidgetOfExactType<IndexedSemantics>();
  }

  @override
  void activate() {
    super.activate();
    _updatePageViewChangedNotifier();
    _pageViewChanged();
  }

  void _pageViewChanged() {
    if(_indexedSemantics!=null){
      leave = _indexedSemantics!.index != _pageViewChangedNotifier!.value;
    }
  }

  void _updatePageViewChangedNotifier() {
    final ValueNotifier<int> newNotifier = PageViewObserver.getNotifier(context);
    if (newNotifier == _pageViewChangedNotifier) {
      return;
    }
    _pageViewChangedNotifier?.removeListener(_pageViewChanged);
    newNotifier.addListener(_pageViewChanged);
    _pageViewChangedNotifier = newNotifier;
  }

  void leaveChanged();

  set leave(bool value) {
    if (value == _leave) return;
    _leave = value;
    leaveChanged();
  }
}