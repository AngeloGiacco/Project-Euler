/*
Euler discovered the remarkable quadratic formula:

n2+n+41
It turns out that the formula will produce 40 primes for the consecutive integer values 0≤n≤39. However, when n=40,402+40+41=40(40+1)+41 is divisible by 41, and certainly when n=41,412+41+41 is clearly divisible by 41.

The incredible formula n2−79n+1601 was discovered, which produces 80 primes for the consecutive values 0≤n≤79. The product of the coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

n2+an+b, where |a|<1000 and |b|≤1000

where |n| is the modulus/absolute value of n
e.g. |11|=11 and |−4|=4
Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n=0.
*/
library euler.problem27;

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
  if (n < 0 ||
      (n > 2 && n % 2 == 0) ||
      (n > 7 && (n % 3 == 0 || n % 5 == 0 || n % 7 == 0))) {
    return false;
  } else {
    return factors(n).length == 2;
  }
}

Function getPrimeFunction(int a, int b) {
  int generator(int n) {
    return n * n + a * n + b;
  }

  return generator;
}

const limit = 1000;
void main() {
  int max_length = 0;
  int productMaxCoeffs = 0;

  for (int i = -limit + 1; i < limit; i++) {
    for (int j = -limit; j < limit; j++) {
      Function primeGenerator = getPrimeFunction(i, j);
      int counter = 0;
      while (checkPrime(primeGenerator(counter))) {
        counter++;
      }
      if (counter > max_length) {
        max_length = counter;
        productMaxCoeffs = i * j;
      }
    }
  }
  print(productMaxCoeffs);
}
