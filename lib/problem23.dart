/*
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
*/
library euler.problem23;

import 'package:more/collection.dart';

int sumProperFactors(int n) {
  int sum = 1;
  for (int divisor = 2; divisor * divisor <= n; divisor++) {
    if (n % divisor == 0) {
      if (n ~/ divisor == divisor) {
        sum += divisor;
      } else {
        sum += divisor + n ~/ divisor;
      }
    }
  }
  return sum;
}

bool isAbundant(int n) => n < sumProperFactors(n);
const int limit = 28123;

void main() {
  final List<int> abundant_numbers = <int>[];
  for (int i = 1; i <= limit; i++) {
    if (isAbundant(i)) {
      abundant_numbers.add(i);
    }
  }
  var sumOfAbundants = BitList(limit + 1);
  for (int i = 0; i < abundant_numbers.length; i++) {
    for (int j = i; j < abundant_numbers.length; j++) {
      if (abundant_numbers[i] + abundant_numbers[j] <= limit) {
        sumOfAbundants[abundant_numbers[i] + abundant_numbers[j]] = true;
      } else {
        break;
      }
    }
  }
  int total = 0;
  for (int i = 1; i < limit; i++) {
    if (!sumOfAbundants[i]) {
      total += i;
    }
  }
  print(total);
}
