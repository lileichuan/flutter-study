void main(List<String> arguments) {
  // SubClass();
  final test = Test();
  test.test();

}


///抽象类
///
///不可以被实例化
abstract class AbstractClass{
  AbstractClass(){
    initInstances();
    print("AbstractClass init");
  }
  void initInstances() {
  }
}


///SubClass
///
/// 继承抽象类AbstractClass
/// with MixinA,MixinB、MixinC
/// with MixinC之前需要with MixinA,MixinB
class SubClass extends AbstractClass with MixinA,MixinB,MixinC{

}

///抽象类MixinA
///
/// 不可实例化，需要是AbstractClass的子类才能被with
mixin  MixinA on AbstractClass{
  @override
  void initInstances() {
    super.initInstances();
    print("MixinA initInstances");
  }
}

///抽象类MixinB
///
/// 不可实例化，需要是AbstractClass的子类才能被with
mixin  MixinB on AbstractClass{
  @override
  void initInstances() {
    super.initInstances();
    print("MixinB initInstances");
  }
}


///抽象类MixinC
///
/// 不可实例化，需要是AbstractClass的子类，同时MixinA、MixinB
mixin  MixinC on AbstractClass,MixinA,MixinB{
  @override
  void initInstances() {
    super.initInstances();
    print("MixinC initInstances");
  }
}



mixin TestA{
  void log(){
    print('TestA log');
  }
}

mixin TestB{
  void log(){
    print('TestB log');
  }
}

mixin TestC{
  void testC(){
    print('TestB log');
  }
}


class Test with TestA,TestB{
  void test(){
    log();
  }

  @override
  void log(){
    super.log();
    print("Test log");
  }
}