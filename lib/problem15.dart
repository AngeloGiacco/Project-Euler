/*
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20×20 grid?
*/

//need to calculate 40! / 20! x 20! = 40 x 39 x 38 ... x 21 / 20!

int factorial(int number) => (number == 1) ? 1 : number * factorial(number - 1);

void main() {
  BigInt twentyOneToForty = BigInt.parse("1");
  for (int i = 21; i <= 40; i++) {
    BigInt multiplier = BigInt.parse(i.toString());
    twentyOneToForty *= multiplier;
  }
  BigInt divisor = BigInt.parse((factorial(20)).toString());
  print(twentyOneToForty / divisor);
}
