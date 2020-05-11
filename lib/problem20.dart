/*
n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
*/
library euler.problem20;

void main() {
  var number = new List<int>.generate(100, (i) => i + 1)
      .fold<BigInt>(
          BigInt.from(1), (prev, current) => prev * BigInt.from(current))
      .toString()
      .split("")
      .fold<int>(0, (a, b) => a + int.parse(b));
  print(number);
}
