/// Problem 14: Longest Collatz sequence
///
/// The following iterative sequence is defined for the set of positive
/// integers:
///
///     n -> n / 2 (n is even)
///     n -> 3 * n + 1 (n is odd)
///
/// Using the rule above and starting with 13, we generate the following
/// sequence:
///
///     13  40  20  10  5  16  8  4  2  1
///
/// It can be seen that this sequence (starting at 13 and finishing at 1)
/// contains 10 terms. Although it has not been proved yet (Collatz Problem), it
/// is thought that all starting numbers finish at 1.
///
/// Which starting number, under one million, produces the longest chain?
///
/// NOTE: Once the chain starts the terms are allowed to go above one million.
library euler.problem14;

class CollatzConjecture {
  // Put your code here
  num collatz(num x) => x % 2 == 0 ? (x / 2) : (3 * x + 1);

  int steps(num start) {
    if (start <= 0) {
      throw ArgumentError('Only positive numbers are allowed');
    } else {
      int count = 0;
      while (start != 1) {
        start = collatz(start);
        count++;
      }
      return count;
    }
  }
}

void main() {
  var c = CollatzConjecture();
  int max_number = 0;
  int max_count = 0;
  for (int i = 1; i < 1000000; i++) {
    int step_count = c.steps(i);
    if (step_count > max_count) {
      max_number = i;
      max_count = step_count;
    }
  }
  print(max_number);
}
