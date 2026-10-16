class Utility {
  T convert<T>(T value){
    return value;
  }
}

class Box<T>{
  T value;
  Box(this.value);
}

class Box1<T extends num>{
  T value;
  Box1(this.value);
}
//T must be subtype of num


