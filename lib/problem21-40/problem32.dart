/*
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
*/
library euler.problem32;
import "package:trotter/trotter.dart";

final items = characters('123456789'),
    indices = List<int>.generate(items.length, (i) => i),
    permsOfItems = indices
        .permutations()
        .iterable
        .map((perm) => perm.map((index) => items[index]).join());

void main() {
  Set<int> mySet = <int>{};
  for (final perm in permsOfItems) {
    int multiple1 = int.parse(perm.substring(0, 3));
    int multiple2 = int.parse(perm.substring(3, 5));
    int product = int.parse(perm.substring(5, 9));
    if (multiple1 * multiple2 == product) {
      mySet.add(product);
    }
    int m1 = int.parse(perm.substring(0, 4));
    int m2 = int.parse(perm.substring(4, 5));
    int p = int.parse(perm.substring(5, 9));
    if (m1 * m2 == p) {
      mySet.add(product);
    }
  }
  print(mySet.toList().fold<int>(0, (a, b) => a + b));
}
