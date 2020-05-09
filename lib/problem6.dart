/*
Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
*/

import 'dart:math';

const limit = 100;
void main() {
  int sum = 0;
  for (int x = 1; x <= limit; x++) {
    sum += pow(x, 2);
  }
  print(pow(5050, 2) - sum);
}
