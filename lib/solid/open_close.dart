//SOLID - OPEN FOR EXTENSION AND CLOSED FOR MODIFICATION

// Software entities that are classes, modules, functions etc. should be open for extension, but closed for modification.

// class Shape{
//   String type;
//   Shape(this.type);
// }
//
// class AreaCalculator{
//   double calculateArea(Shape shape){
//     if(shape.type == 'circle'){
//       return 3.14 * 3.14;
//     } else if(shape.type == 'rectangle'){
//       return 4 * 5;
//     } else if(shape.type == 'square'){
//       return 4 * 4;
//     }
//     return 0;
//   }
// }

// The above class violates OCP, because every time a new shape is introduced, it requires a change in existing calculateArea method. If at all any other shape added in future, this method needs to be modified.

abstract interface class Shape{
  double calculateArea();
}
class Circle implements Shape{
  double radius;
  Circle(this.radius);
  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }
}

class Rectangle implements Shape{
  double length;
  double breadth;
  Rectangle(this.length, this.breadth);
  @override
  double calculateArea() {
    return length * breadth;
  }
}
class AreaCalculator {
  double calculateArea(Shape shape){
    return shape.calculateArea();
  }
}
//The above follows OCP, if any shape needs to be added it can be easily added without altering existing one.
//OCP allows systems to be easily extended, reduces the risk of bugs and unintended side effects.
// encourages abstraction.
//scalability
// promotes design patterns
//