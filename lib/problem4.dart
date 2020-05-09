bool checkPalindrome(int number) {
  return int.parse(number.toString().split("").reversed.join("")) == number;
}

const min = 100;
const max = 999;

void main() {
  int maximum_palindrome = 0;
  for (int x = max; x >= min; x--) {
    for (int y = x; y >= min; y--) {
      int product = x * y;
      if (product > maximum_palindrome && checkPalindrome(product)) {
        maximum_palindrome = product;
      }
    }
  }
  print(maximum_palindrome);
}
