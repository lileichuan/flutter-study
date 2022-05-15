import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FzRenderObjectWidget extends RenderObjectWidget{
  const FzRenderObjectWidget({Key? key}) : super(key: key);

  @override
  FzRenderObjectElement createElement() => FzRenderObjectElement(this);

  @override
  RenderBox createRenderObject(BuildContext context) => FzRenderBox();

}

class FzRenderObjectElement extends RenderObjectElement{
  FzRenderObjectElement(FzRenderObjectWidget widget) : super(widget);
  @override
  void forgetChild(Element child) {
    assert(false);
    super.forgetChild(child);
  }

  @override
  void insertRenderObjectChild(RenderObject child, Object? slot) {
    assert(false);
  }

  @override
  void moveRenderObjectChild(RenderObject child, Object? oldSlot, Object? newSlot) {
    assert(false);
  }

  @override
  void removeRenderObjectChild(RenderObject child, Object? slot) {
    assert(false);
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    return widget.debugDescribeChildren();
  }
}

class FzRenderBox extends RenderBox{

  @override
  double computeMaxIntrinsicWidth(double height) {
    return 100;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return 100;
  }

  @override
  bool get sizedByParent => true;

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return constraints.constrain(const Size(100, 200));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    try {
      context.canvas.drawRect(offset & size, Paint()
        .. color = Colors.red);
    } catch (error) {
      if (kDebugMode) {
        print("paint error");
      }
    }
  }
}