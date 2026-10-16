

import 'package:companion/misc/day1.dart';

import 'day_one_notes.dart';

String? name;

String displayName = name ??"unknown";

int add(int a, int b) => a+b;

void createUser({required String name, int age = 0}){}

//positional optional parameters

void greet(String name, [String? message]){}

int add1(int a, int b){
  return a + b;
}

var operation = add1(20,30);

Function counterClosure() {
  int count = 0;
  return (){
    count++;
    return count;
  };
}

void execute(int a, int b, Function(int,int) operation){
  print(operation(a,b));
}

void main(){

  greet("name", "mmm");

  final c = counterClosure();

  print(c());

  print(c());

  execute(10, 20, (a,b)=>a+b);

  // HeyPrivate h = HeyPrivate();
  // h._private = 999;


}

class Ex implements Anim{
  @override
  void eat() {
    // TODO: implement eat
  }

}

class Ex1 extends Dog{

}
