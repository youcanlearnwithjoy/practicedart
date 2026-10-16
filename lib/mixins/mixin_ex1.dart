mixin CanFly {
  int count = 0;
  void fly(){
    print("Flying...");
  }
}

class Bird with CanFly{}


// Second Examples- Sometimes mixin needs methods or properties from another class


class Animal {
  int testVar = 0;
  void eat(){
    print("Eating..");
  }
}
mixin CanWalk on Animal{
  void walk(){
    eat();
    print("Walking... $testVar");
  }
}

class Dog extends Animal with CanWalk{

}

main(){
  Bird bird = Bird();
  bird.fly();
  print(bird.count);
  //Example 2
  Dog().walk();

}