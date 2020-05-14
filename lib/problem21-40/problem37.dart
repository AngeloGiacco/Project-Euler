/*
The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
*/

library euler.problem37;

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
  if (n > 7 && (n % 3 == 0 || n % 5 == 0 || n % 7 == 0) || n == 1) {
    return false;
  } else {
    return factors(n).length == 2;
  }
}

bool checkTruncPrime(int n) {
  String nStr = n.toString();
  bool flag = true;
  for (int i = 0; i < nStr.length; i++) {
    String nLeft = nStr.substring(0, i + 1);
    String nRight = nStr.substring(nStr.length - 1 - i, nStr.length);
    if (!(checkPrime(int.parse(nLeft)) && checkPrime(int.parse(nRight)))) {
      flag = false;
      break;
    }
  }
  return flag;
}

void main() {
  int count = 0;
  List<int> truncPrimes = [];
  int number = 9;
  while (count < 11) {
    if (checkTruncPrime(number)) {
      truncPrimes.add(number);
      count++;
    }
    number += 2;
  }
  print(truncPrimes.fold<int>(0, (a, b) => a + b));
}
