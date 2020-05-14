/*
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
*/

library euler.problem35;

import "dart:math";

const limit = 1000000;
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
  if (n < 0 ||
      (n > 2 && n % 2 == 0) ||
      (n > 7 && (n % 3 == 0 || n % 5 == 0 || n % 7 == 0))) {
    return false;
  } else {
    return factors(n).length == 2;
  }
}

bool checkPrimePermutations(int n) {
  String number = n.toString();
  if (!(number.split("").any((element) => int.parse(element) % 2 == 0) &&
      n > 2)) {
    bool flag = true; //no non primes found
    int l = number.length;
    String temp = number + number;
    for (int i = 0; i < l; i++) {
      List<String> res = [];
      for (int j = 0; j < l; j++) {
        res.add(temp[i + j]);
      }
      if (!checkPrime(int.parse(res.join("")))) {
        flag = false;
        break;
      }
    }
    return flag;
  } else {
    return false;
  }
}

void main() {
  Set<int> s = new Set();
  s.add(2);
  for (int i = 3; i < limit; i += 2) {
    if (checkPrimePermutations(i)) {
      s.add(i);
    }
  }
  print(s.length);
}
