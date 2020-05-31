/* 
Problem 50
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
*/

library euler.problem50;

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
  if (n > 7 && (n % 3 == 0 || n % 5 == 0 || n % 7 == 0)) {
    return false;
  } else {
    return factors(n).length == 2;
  }
}

List<int> generatePrimes(int limit) {
  List<int> res = <int>[];
  res.add(2);
  for (int i = 3; i <= limit; i += 2) {
    if (checkPrime(i)) {
      res.add(i);
    }
  }
  return res;
}

int primeSequenceLength(int n) {
  for (int length = primes.length; length >= 1; length--) {
    bool cont_flag = false;
    for (int i = 0; i < primes.length - length + 1; i++) {
      int sum = primes.sublist(i, i + length).fold(0, (p, c) => p + c);
      if (sum > limit) {
        cont_flag = true;
        break;
      } else if (n == sum) {
        return length;
      }
    }
    if (cont_flag) {
      continue;
    }
  }
  return 1;
}

const int limit = 1000000;
final List<int> primes = generatePrimes(limit);

void main() {
  int max_prime = 0;
  int max_sequence = 0;
  for (int i = 3; i < limit; i += 2) {
    if (primes.contains(i) && primeSequenceLength(i) > max_sequence) {
      max_sequence = primeSequenceLength(i);
      max_prime = i;
    }
  }
  print(max_prime);
}
