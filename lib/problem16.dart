import 'dart:math';

void main() {
  BigInt power = BigInt.parse("2").pow(1000);
  List<String> digits = power.toString().split("");
  int sum = 0;
  digits.forEach((element) {
    sum += int.parse(element);
  });
  print(sum);
}
