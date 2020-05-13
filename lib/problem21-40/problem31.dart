/*

*/
library problem31.dart;

const int goal = 200;
final List<int> coins = [1, 2, 5, 10, 20, 50, 100, 200];
void main() {
  List<int> ways = new List<int>.generate(201, (i) => 0);
  ways[0] = 1;
  for (int i = 0; i < coins.length; i++) {
    for (int j = coins[i]; j <= goal; j++) {
      ways[j] += ways[j - coins[i]];
    }
  }
  print(ways[200]);
}
