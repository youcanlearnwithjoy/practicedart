/**
 * A factory constructor can return an existing object, a cached object, or even
 * an object of a sub class.
 */

class Person{
  final String name;
  factory Person(String name){
    return Person._internal(name);
  }
  Person._internal(this.name);
}

class Logger {
  static final Logger _instance = Logger._internal();
  factory Logger(){
    return _instance;
  }

  Logger._internal();
}

abstract class Animal{
  void sound();
  factory Animal(String type){
    if (type == "dog"){
      return Dog();
    }else {
      return Cat();
    }
  }
}

class Dog implements Animal {
  @override
  void sound(){
    print("Bark");
  }
}

class Cat implements Animal {
  @override
  void sound(){
    print("Meow");
  }
}



/*
class Person1 implements Dog{
   String? name;
   int? age;
  // Person1(this.name) : age = 40 {
  //   print("Body");
  // }
  Person1(String name, int age){
    this.name = name;
    this.age = age;
  }

}*/

interface class Anim{
  void eat(){
    print(" Eating ");
  }
}

class D implements Anim {
  @override
  void eat() {
    print("Dog is eating");
  }

}

class C extends Anim{
  void test(){
    eat();
  }
}

abstract interface class  PaymentService{
  void pay(double amount);
  void refund(double amount);
  void test(){
    print("Hey Test --->>>");
  }
}

void main(){
  t tt = t();

}
interface class t{
   void te() {
     // TODO: implement te
   }
}