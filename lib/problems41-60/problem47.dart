/*
Problem 47
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 × 7
15 = 3 × 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19.

Find the first four consecutive integers to have four distinct prime factors each. What is the first of these numbers?
*/
library euler.problem47;

Set<int> primeFactors(int n) {
  Set<int> p = {};
  while (n % 2 == 0) {
    n = n ~/ 2;
    p.add(2);
  }

  for (int i = 3; i <= n; i += 2) {
    while (n % i == 0) {
      p.add(i);
      n = n ~/ i;
    }
  }
  return p;
}

int distinctPrimeFactors(int n) => primeFactors(n).length;
final int target = 4;

void main() {
  List<int> distincts = [];
  for (int x = 2;; x++) {
    distincts.add(distinctPrimeFactors(x));
    if (distincts.length > target) {
      distincts.removeAt(0);
      if (distincts.every((element) => element == target)) {
        print(x - (target - 1));
        break;
      }
    }
  }
}
