/*
List (ordered Collection)


 */

void main(){
  var growable = [1,2,3];
  var fixed = List.filled(3, 0);
  var empty = <int>[];
  // print(growable.reversed);
 growable.shuffle();
 print(growable);

 print(growable.asMap());

 var mixList = [1,"a", "s", 3, "d", "f",4];

 print(mixList.whereType<int>());

 // mixList.replaceRange(1, 2, [9,10,11,0]);
 // print(mixList);

 mixList.whereType<int>().firstWhere((element) => (element > 2));

 var lst = [1,2,3,4,5,6];

  print(lst.fold<int>(0, (i, j) => i + j));
// print(lst.fold(0, (i,j) => (i! + j)));

}