void main(List<String> arguments) {
  ClassA();
}

class ClassA extends ClassBase with MixinA,MixinB,MixinC{

}
abstract class ClassBase{
  ClassBase(){
    initInstances();
    print("ClassBase init");
  }
  void initInstances() {
  }
}

mixin  MixinA on ClassBase{
  @override
  void initInstances() {
    super.initInstances();
    print("MixinA initInstances");
  }
}

mixin  MixinB on ClassBase{
  @override
  void initInstances() {
    super.initInstances();
    print("MixinB initInstances");
  }
}

mixin  MixinC on ClassBase,MixinB,MixinA{
  @override
  void initInstances() {
    super.initInstances();
    print("MixinC initInstances");
  }
}
