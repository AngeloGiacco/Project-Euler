/*
Problem 48
The series, 11 + 22 + 33 + ... + 1010 = 10405071317.

Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.
*/
library euler.problem48;

void main() {
  List<BigInt> powers =
      List<BigInt>.generate(1001, (index) => BigInt.from(index).pow(index));
  BigInt sum = powers.fold<BigInt>(BigInt.from(-1), (a, b) => a + b);
  print(sum % BigInt.from(10000000000));
}
