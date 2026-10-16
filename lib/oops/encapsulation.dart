/***
 * Bundling data and the operations that work on the data together
 * while controlling how that data can be accessed or modified.
 *
 * IN broader = state + behaviour + controlled access to that state/behaviour
 */

class BankAccount{
  double _balance = 0;
  void deposit(double amount){
    if(amount <= 0){
      throw ArgumentError('Amount must be positive');
    }
    _balance += amount;
  }

  void withdraw(double amount){
    if(amount <= 0){
      throw ArgumentError('Amount must be positive');
    }
    if(amount > _balance){
      throw StateError('Insufficient balance');
    }
    _balance -= amount;
  }

  double get balance{
    return _balance;
  }

}

main(){
  BankAccount b = BankAccount();
  b.deposit(300);
}