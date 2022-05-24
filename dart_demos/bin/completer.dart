import 'dart:async';

void main(List<String> arguments) async{
  String result = await testAsync();
  print("result is $result");
}


Future<String> testAsync() async{
  Completer c = Completer();

  for(var i = 0;i<1000;i++){
    if (i == 900 && c.isCompleted == false) {
      c.completeError('error in $i');
    }
    if (i == 800 && c.isCompleted == false) {
      c.complete('complete in $i');
    }
  }
  try {
    print("先返回了吗。。。。。。");
    String res = await c.future;
    return res;
  } catch (e) {
    return "error";
  }

}