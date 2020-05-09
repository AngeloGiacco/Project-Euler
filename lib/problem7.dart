/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
*/

import 'package:more/math.dart';

final target = 10001;

int get_prime(int index) {
  int upper_lim = 500000;
  var prime_list = upper_lim.primes;
  return prime_list.elementAt(index - 1);
}

void main() {
  print(get_prime(target));
}
