/*
There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
*/

import 'dart:math';

bool check_pythagoras(int a, int b, int c) {
  return pow(c, 2) == (pow(a, 2) + pow(b, 2));
}

void main() {
  for (int x = 1; x <= 500; x++) {
    for (int y = 1; y <= 500; y++) {
      for (int z = 1; z <= 500; z++) {
        if (x + y + z == 1000) {
          if (check_pythagoras(x, y, z)) {
            print("Numbers are $x $y $z");
          }
        }
      }
    }
  }
}
