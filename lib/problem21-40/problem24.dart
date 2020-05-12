/*
A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
*/

//Reasoning:

/*
all permutations starting with zero will number 9! = 362880
362880 x 2 < 1million but 362880 x 3 > 1 million therefore the millionth lexicographic permutation must start with 2
total permutations already = 362880 x 2 = 725760
by comparing whether or not the factorial of remaining digits is above or below the goal we can get the solution 
this method depends on the numbers array being sorted at the start.
idk how to explain my idea, hopefully my code explains it
*/
library euler.problem24;

int goal = 1000000;
int factorial(int n) => n > 1 ? n * factorial(n - 1) : 1;
List<int> numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

void main() {
  List<int> result = <int>[];
  int step = 0;
  while (step < 10) {
    int index = 0;
    while (factorial(numbers.length - 1) < goal) {
      goal -= factorial(numbers.length - 1);
      index++;
    }
    result.add(numbers.removeAt(index));
    step++;
  }
  print(result.join(""));
}
