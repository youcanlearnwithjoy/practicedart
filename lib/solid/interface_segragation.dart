//SOLID - INTERFACE SEGREGATION

/**
 * states that client should not be forced to depend
 * up on interfaces that they do not use.
 *
 * It emphasizes the importance of keeping interfaces slim and relavant.
 *  and relavant to the clients that implement them this is why it might
 *  feel very similar to the Single responsibiltiy principle.
 *
 */

abstract interface class Worker {
  void work();
  void eat();
}

class Developer implements Worker{
  @override
  void work() {
    print("Developer is working...");
  }

  @override
  void eat() {
    print("Developer is eating ...");
  }
}

class Waiter implements Worker{
  @override
  void work() {
    print("Waiter is working...");
  }

  @override
  void eat() {
    print("Waiter is eating ...");
  }
}

void main(){
  var developer = Developer();
  developer.work();
  developer.eat();
  var waiter = Waiter();
  waiter.work();
  waiter.eat();


}