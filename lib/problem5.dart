/*2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/
const min = 2522;
const List<int> numbers = [
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20
];
void main() {
  var value = min;
  bool found = false;
  while (!found) {
    if (numbers.every((number) => value % number == 0)) {
      print(value);
      found = true;
    } else {
      value += 2;
    }
  }
}
