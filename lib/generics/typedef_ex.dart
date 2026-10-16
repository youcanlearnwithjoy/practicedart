/*
A typedef gives a name(alias) to a type.
 */

void execution(String name, void Function(String) callback){
  callback(name);
}

typedef Callback = void Function(String);

void executionUpdated(String name, Callback callback){
  callback(name);
}