/* 
If we list all the natural numbers below 10 that are multiples of 3 or 5
we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
*/

class Mult3or5Sum {
  int total(int limit) {
    int res = 0;
    for (int i = 3; i < limit; i++) {
      if (i % 3 == 0 || i % 5 == 0) {
        res += i;
      }
    }
    return res;
  }
}

void main(List<String> arguments) {
  Mult3or5Sum m = new Mult3or5Sum();
  print(m.total(1000));
}
