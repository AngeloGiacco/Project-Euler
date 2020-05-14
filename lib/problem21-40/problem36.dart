/*
The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
*/

const limit = 1000000;
bool checkPalindrome(String s) => s.split("").reversed.toList().join("") == s;

void main() {
  print(checkPalindrome(585.toString()));
  int sum = 0;
  for (int i = 0; i < limit; i++) {
    if (checkPalindrome(i.toString()) && checkPalindrome(i.toRadixString(2))) {
      sum += i;
    }
  }
  print(sum);
}
