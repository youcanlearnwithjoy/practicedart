void main(){

 /* String name = "Vasu";

  print("1 $name : ${name.hashCode}");

  name = name.toUpperCase();

  print("2 $name : ${name.hashCode}");*/

  // multilineText();
  // rawString();
  // lenProps();

  // searchStr();
  // extractingStr();
  // splitsJoins();
  // padStrings();
  regEx();
}

void multilineText(){
  String a = 'Hello';
  String b = "World";

  // Multiline strings
  String c = '''
  Hello
  Dart
  ''';

  String d = """
  Flutter
  Development
  """;

  print('$c $d');
}

void rawString(){
  String path = r'C:\Users\Vasu\Documents';

  print("RawString $path");
}

void lenProps(){
  String text = ' Flutter Dart  ';
  print(text.length);
  print(text.isEmpty);
  print(text.isNotEmpty);
  print(text.toUpperCase());
  print(text.toLowerCase());
  print(text.trim());
  print(text.trimRight());
  print(text.trimLeft());
}

void searchStr(){
  String text = "Dart makes Flutter powerful";
  print(text.contains('Flutter'));
  print(text.startsWith('Dart'));
  print(text.endsWith('powerful'));
  print(text.indexOf('Flutter'));
  print(text.lastIndexOf('a'));
}

void extractingStr(){
  String text = "Flutter Developer";
  print(text.substring(0,7));
  print(text.replaceFirst('Flutter', 'Dart'));
  print(text.replaceAll('e', 'E'));
}

void splitsJoins(){
  String text = "apple,banana,mango";
  List<String> fruit = text.split(',');
  print(fruit);
  print(fruit.join(' | '));
}

void padStrings(){

  String number = '42';
  print(number.padLeft(5,'0'));
  print(number.padRight(5, '*'));
  String text = 'Dart';
  print(text[0]);
  print(text[3]);
}

void regEx(){
  String text = "Order 123, Order 456";
  RegExp regExp = RegExp(r'\d+');
  print(regExp.allMatches(text).length);
  print(text.replaceAll(RegExp(r'\d+'), 'XXX'));
}