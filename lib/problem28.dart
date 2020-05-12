/*
Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101 => sum of 21 7 1 3 13 25 9 5 17

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
*/
library euler.problem28;

int getSumSquare(int start, int separation) => 4 * start + 6 * separation;
const limit = 1001; // for limit is 7 add 31 37 43 49
void main() {
  int sum = 1;
  int curr = 3;
  for (int i = 1; 2 * i + 1 <= limit; i++) {
    sum += getSumSquare(curr, 2 * i);
    curr += 8 * i + 2;
  }
  print(sum);
}
