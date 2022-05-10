import 'package:flutter/material.dart';

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