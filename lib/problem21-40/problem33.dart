/*
The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
*/
library euler.problem33;

bool shareOneDigit(String num1, String num2) =>
    Set.from((num1 + num2).split("")).length == 3 &&
    Set.from(num1.split("")).length == Set.from(num2.split("")).length;

List<int> cancelledFractionDigits(int n1, int n2) {
  //incorrectly cancelled as stipulated by question
  List<int> res;
  if (n1 ~/ 10 == n2 ~/ 10) {
    res = [n1 % 10, n2 % 10];
  } else if (n1 % 10 == n2 ~/ 10) {
    res = [n1 ~/ 10, n2 % 10];
  } else if ((n1 % 10 == n2 % 10)) {
    res = [n1 ~/ 10, n2 ~/ 10];
  } else if (n1 ~/ 10 == n2 % 10) {
    res = [n1 % 10, n2 ~/ 10];
  }
  return res;
}

void main() {
  for (int i = 10; i < 100; i++) {
    // numerator
    for (int j = 10; j < 100; j++) {
      // denominator
      if (j % 10 == 0 || i % 10 == 0 || i == j || i > j) {
        continue;
      } else {
        if (shareOneDigit(i.toString(), j.toString())) {
          if ((cancelledFractionDigits(i, j)[0] /
                  cancelledFractionDigits(i, j)[1]) ==
              i / j) {
            print("numerator $i and denominator $j");
          }
        }
      }
    }
  }
}
