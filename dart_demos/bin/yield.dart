
///一、多元素同步函数生成器
///1. sync* 和 yield
///sync*是一个dart语法关键字。它标注在函数{ 之前，其方法必须返回一个 Iterable<T>对象
///
///2.sync* 和 yield*
///
///
///
///

void main(List<String> arguments) async{
  for(var i in getRange(4, 6)){
    print(i);
  }
  await for(var i in str(5)){
    print(i);
  }
}

Iterable<int> getRange(int start, int finish) sync* {
  for (int i = start; i <= finish; i++) {
    yield i;
  }
}

Stream<int> str(int n) async* {
  if (n > 0) {
    yield n;
    yield* str(n - 1);
  }
}