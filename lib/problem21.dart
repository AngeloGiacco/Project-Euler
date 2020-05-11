/*
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
*/

import 'dart:math';

int sumFactors(int n) {
  var factorsArr = [];
  factorsArr.add(1);
  for (var test = n - 1; test >= sqrt(n).toInt(); test--)
    if (n % test == 0) {
      factorsArr.add(test);
      factorsArr.add(n ~/ test);
    }
  int sum = factorsArr.fold<int>(0, (prev, curr) => prev + curr);
  return sum;
}

void main() {
  int sum = 0;
  for (int i = 0; i < 10000; i++) {
    if (sumFactors(sumFactors(i)) == i && sumFactors(i) > i) {
      sum += sumFactors(i) + i;
    }
  }
  print(sum);
}
