/*
An irrational decimal fraction is created by concatenating the positive integers:

0.123456789101112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, find the value of the following expression.

d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
*/
const int limit = 1000000;
void main() {
  String res = "";
  int count = 1;
  while (res.length < limit) {
    res += count.toString();
    count++;
  }
  print(int.parse(res[0]) *
      int.parse(res[9]) *
      int.parse(res[99]) *
      int.parse(res[999]) *
      int.parse(res[9999]) *
      int.parse(res[99999]) *
      int.parse(res[999999]));
}
