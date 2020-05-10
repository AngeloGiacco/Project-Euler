/*
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 21000?
*/
library euler.problem16;

void main() {
  BigInt power = BigInt.parse("2").pow(1000);
  List<String> digits = power.toString().split("");
  int sum = 0;
  digits.forEach((element) {
    sum += int.parse(element);
  });
  print(sum);
}
