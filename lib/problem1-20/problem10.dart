/*
Find the sum of all the primes below two million.
*/
library euler.problem10;

import 'package:more/math.dart';

void main() {
  var prime_arr = 2000000.primes;
  print(prime_arr.reduce((a, b) => a + b));
}
