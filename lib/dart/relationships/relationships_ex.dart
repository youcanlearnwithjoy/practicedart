/*
Relationship indicates,
"How is one object related to another object?"
IS-A --> Inheritance
HAS-A --> Association/Aggregation/Composition
USES-A --> Dependency
IMPLEMENTS-A ---> interface/Contract
IS-IMPLEMENTED-BY ---> Realization
PART-OF ---> Composition/Aggregation
 */

//IS-A :  One class is a specialized form of another class.

// A Dog is an Animal

class Animal{
  void eat(){
    print("Eating..");
  }
}

class Dog extends Animal{
  void bark(){
    print("Barking...");
  }
}