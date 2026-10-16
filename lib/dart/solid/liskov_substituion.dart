
//SOLID - LISKOV SUBSTITUTION PRINCIPLE
/**
 * Objects of a super class should be replaciable with the objects of subclass
 * without effecting the correctness of the program.
 */


abstract class Animal {
  void makeSound();
}

class Lion extends Animal{
  @override
  void makeSound(){
    print('Roar');
  }
}

void makeAnimalSound(Animal animal){
  animal.makeSound();
}

void main(){
  Animal animal = Lion();
  makeAnimalSound(animal);

  //Liskovs substituion below
  Lion lion = Lion();
  makeAnimalSound(lion);
}

//How inheritance should be used and maintain the correctness of the program
// and ensure the substitutability of objects this means that simply inheriting from
// a superclass doesn't automatically ensure that a code is following liskov's princhiple
// you also need to make sure that sub class doesn't violate the contracts established
//by the super class and we need to make sure that it doesn't alter the behavior in unexpected
// ways when substituting objects 