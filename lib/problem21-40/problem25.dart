/*
The Fibonacci sequence is defined by the recurrence relation:

Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
Hence the first 12 terms will be:

F1 = 1
F2 = 1
F3 = 2
F4 = 3
F5 = 5
F6 = 8
F7 = 13
F8 = 21
F9 = 34
F10 = 55
F11 = 89
F12 = 144
The 12th term, F12, is the first term to contain three digits.

What is the index of the first term in the Fibonacci sequence to contain 1000 digits?
*/

library euler.problem25;

class Fibonnaci {
  BigInt value,
      prev; //well this has taken me ages because ints were overflowing into negative numbers and that meant they never reached the condition

  Fibonnaci(this.value, this.prev);

  BigInt get_value() {
    return value;
  }

  Fibonnaci find_next() {
    return new Fibonnaci(value + prev, value);
  }
}

final digits = 1000;

void main(arguments) {
  //essentially every third element of the fibonacci series will be an even number
  var x = new Fibonnaci(BigInt.from(2), BigInt.from(1));
  var count = 3;
  while (x.get_value().toString().length < digits) {
    x = x.find_next();
    count++;
  }
  print(count);
}
