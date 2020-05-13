/*
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
*/
library euler.problem34;

int fib(int n) => (n == 1) ? 1 : n * fib(n - 1);
final List<int> fibs =
    [1, 1, 2, 3, 4, 5, 6, 7, 8, 9].map((element) => fib(element)).toList();
const limit = 1000000;

void main() {
  int sum = 0;
  for (int i = 3; i < limit; i++) {
    if (i
            .toString()
            .split("")
            .map((e) => int.parse(e))
            .toList()
            .fold<int>(0, (a, b) => a + fibs[b]) ==
        i) {
      sum += i;
    }
  }
  print(sum);
}
