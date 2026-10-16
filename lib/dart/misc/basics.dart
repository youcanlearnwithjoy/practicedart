/**
 * Important distinction in Dart:
 * whether a variable must be initialized depends on where the variable is declared and whether it is nullable, late etc.
 * three placess: Inside a class (instance/static fields), Inside a function (local variables), At top level of a file/library (top level variables)
 *
 */

//int age --> declaration
// int age = 40 -->> declaring + initialization

//1. Local variable inside a function

void main(){
  int age; // allowed // restriction -> A non-nullable local variable  must be
  //definitely assigned before reading it.
  age = 40;
  print(age);

  var height;

  print(height);// is allowed because the variable is effectively dynamic.

  var marks = 99;

}

/**
 *  This is not valid , becz age hasn't been assigned a value yet.
 * void main(){
    int age;
    print(age);
    }
 */