void main(List<String> arguments) {
  Person p = Person(1);
  Person p1 = p;
  print("before p1 number is ${p.number}");
  print("p1 number is ${p1.number}");
  p.number = 2;
  print("before p1 number is ${p.number}");
  print("p1 number is ${p1.number}");

  changePerson(p);
  print("before p1 number is ${p.number}");
  print("p1 number is ${p1.number}");

  int number = 10;
  print("number is $number");
  changeNumber(number);
  print("number is $number");
  print("number1 hashCode is ${number.hashCode}");

  print("functions is object is ${p.test is Object}");

}

void changePerson(Person p){
  p.number = 3;
}

void changeNumber(int number){
  print("number hashCode is ${number.hashCode}");
  number = 11;
  print("number hashCode is ${number.hashCode}");
}

class Person{
  int number; ///学号
  Person(this.number);

  void test(){}
}