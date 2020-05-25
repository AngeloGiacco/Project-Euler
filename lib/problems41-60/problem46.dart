/*
Problem 46
It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.

9 = 7 + 2×12
15 = 7 + 2×22
21 = 3 + 2×32
25 = 7 + 2×32
27 = 19 + 2×22
33 = 31 + 2×12

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
*/
library euler.problem46;

import "dart:math";
import 'package:more/math.dart';

List<int> factors(int n) {
  var factorsArr = <int>[];
  factorsArr.add(n);
  factorsArr.add(1);
  for (var test = n - 1; test >= sqrt(n); test--)
    if (n % test == 0) {
      factorsArr.add(test);
      if (n ~/ test != test) {
        factorsArr.add(n ~/ test);
      }
    }
  return factorsArr;
}

bool checkPrime(int n) {
  if (n % 3 == 0 || n % 5 == 0 || n % 7 == 0) {
    return false;
  } else {
    return factors(n).length == 2;
  }
}

final List<int> squareNumbers = List<int>.generate(10000, (i) => i * i);

final List<int> primes = 10000.primes.toList();

bool checkComposite(int n) => primes
    .takeWhile((prime) => prime < n - 1)
    .any((prime) => squareNumbers.contains((n - prime) ~/ 2));

void main() {
  for (int i = 9;; i += 2) {
    if (!primes.contains(i) && !checkComposite(i)) {
      print(i);
      break;
    }
  }
}
