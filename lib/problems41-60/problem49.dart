/*
Problem 49
The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?
*/
library euler.problem49;

import "dart:math";

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

List<int> getPrimes(int start, int end) {
  List<int> res = [];
  for (int i = start; i < end; i++) {
    if (checkPrime(i)) {
      res.add(i);
    }
  }
  return res;
}

final List<int> primes = getPrimes(1000, 10000);

int getThirdPrime(int i, int j) => 2 * primes[j] - primes[i];

bool checkPermutation(int first, int second, int third) {
  Set f = Set.from(first.toString().split(""));
  Set s = Set.from(second.toString().split(""));
  Set t = Set.from(third.toString().split(""));

  return s.length == f.length &&
      f.length == t.length &&
      t.containsAll(s) &&
      s.containsAll(t) &&
      f.containsAll(t) &&
      t.containsAll(f);
}

void main() {
  int first, second;
  for (int i = 0; i < primes.length; i++) {
    for (int j = i + 1; j < primes.length; j++) {
      int third = getThirdPrime(i, j);

      if (primes.contains(third)) {
        first = primes[i];
        second = primes[j];
        if (checkPermutation(first, second, third)) {
          print("$first$second$third");
        }
      }
    }
  }
}
