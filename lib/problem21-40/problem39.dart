/*
Problem 39

If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?
*/

int getOptions(int n) {
  int res = 0;
  int c;
  for (int a = 1; a <= n / 3; a++) {
    //solution relies on the observation that a < b < c and a + b + c = n
    for (int b = a; b <= n / 2; b++) {
      // thus a < n/3 and b < n / 2
      c = n - a - b;
      if (a * a + b * b == c * c) {
        res++;
      }
    }
  }
  return res;
}

const limit = 1000;
void main() {
  int max = 0;
  int max_gen_value = 0;
  for (int i = 1; i <= limit; i++) {
    int options = getOptions(i);
    if (options > max) {
      max = options;
      max_gen_value = i;
    }
  }
  print(max_gen_value);
}
