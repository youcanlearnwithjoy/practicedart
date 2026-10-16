/*String compress(String input) {
  if (input.isEmpty) return '';

  StringBuffer result = StringBuffer();
  int count = 1;

  for (int i = 1; i < input.length; i++) {
    if (input[i] == input[i - 1]) {
      count++;
    } else {
      print("Result ${result} $i");
      result.write('${input[i - 1]}$count');
      count = 1;
    }
  }
  // print("REsult ${input}.  ${result}");
  result.write('${input[input.length - 1]}$count');
  // print("REsult --- ${input}.  ${result}");

  return result.toString();
}*/

// void main() {
//   print(compress('aaabbccccd')); // a3b2c4d1
//   print(compress('abcd'));       // a1b1c1d1
//   print(compress(''));           // ''
// }

bool isRotation(String first, String second) {
  if (first.length != second.length) {
    return false;
  }
  print("${first+first}");
  print("$second");
  return (first + first).contains(second);
}

void main() {
  print(isRotation('waterbottle', 'erbottlewat')); // true
  print(isRotation('hello', 'world'));             // false
}