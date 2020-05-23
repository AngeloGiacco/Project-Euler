/*
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
*/
library euler.problem41;

import "dart:math";
import 'package:trotter/trotter.dart';

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

List<int> getOddPermutations(int n) {
  List<int> res = [];
  List<String> digits = new List<String>.generate(n, (i) => (i + 1).toString());
  var p = Permutations(n, digits);
  for (final perm in p.iterable) {
    int value = int.parse(perm.join(""));
    if (value % 2 == 1) {
      res.add(value);
    }
  }
  return res;
}

void main() {
  bool found = false;
  for (int i = 9; i >= 4; i--) {
    List<int> numbers = getOddPermutations(7);
    numbers.sort((b, a) => a.compareTo(b));
    for (var number in numbers) {
      if (checkPrime(number)) {
        print(number);
        found = true;
        break;
      }
    }
    if (found) {
      break;
    }
  }
}
