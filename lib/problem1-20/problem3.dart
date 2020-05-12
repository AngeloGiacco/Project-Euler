/*
What is the largest prime factor of the number 600851475143 ?
*/
library euler.problem3;

import 'dart:math';
import 'package:more/math.dart';

const int value = 600851475143;
void main() {
  int limit = sqrt(value).ceil();

  var prime_arr = limit.primes;
  int factor = prime_arr.lastWhere((prime) => value % prime == 0);
  print(factor);
}
