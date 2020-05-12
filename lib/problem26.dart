/*
A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

1/2	= 	0.5
1/3	= 	0.(3)
1/4	= 	0.25
1/5	= 	0.2
1/6	= 	0.1(6)
1/7	= 	0.(142857)
1/8	= 	0.125
1/9	= 	0.(1)
1/10	= 	0.1
Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
*/
library euler.problem26;

String findRecurringDigits(int denom) {
  String res = "";
  Map<int, int> m = new Map<int, int>();
  int rem = 1;
  while (rem != 0 && !m.containsKey(rem)) {
    m[rem] = res.length;
    rem *= 10;
    int res_part = rem ~/ denom;
    res += res_part.toString();
    rem = rem % denom;
  }
  return (rem == 0) ? "" : res;
}

const limit = 1000;

void main() {
  int max = 0;
  int den = 0;
  for (int i = 1; i < limit; i++) {
    if (max < findRecurringDigits(i).length) {
      max = findRecurringDigits(i).length;
      den = i;
    }
  }
  print(den);
}
