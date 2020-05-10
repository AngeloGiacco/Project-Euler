const List<String> numbersToTwenty = [
  '',
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine',
  'ten',
  'eleven',
  'twelve',
  'thirteen',
  'fourteen',
  'fifteen',
  'sixteen',
  'seventeen',
  'eighteen',
  'nineteen',
];

const List<String> tens_list = [
  '',
  'ten',
  'twenty',
  'thirty',
  'forty',
  'fifty',
  'sixty',
  'seventy',
  'eighty',
  'ninety',
];

String representTensUnits(int number) {
  String message = "";
  if (number == 0) {
    message = "";
  } else if (number <= 19) {
    message = numbersToTwenty[number];
  } else if (number >= 20) {
    var tens = int.parse(number.toString().substring(0, 1));
    var units = int.parse(number.toString().substring(1, 2));
    message += tens_list[tens];
    message += numbersToTwenty[units];
  }
  return message;
}

String representNumber(int number) {
  String message = "";
  if (number == 1000) {
    message = "onethousand";
  } else if (number >= 100) {
    var hundreds = int.parse(number.toString().substring(0, 1));
    var tensunits = int.parse(number.toString().substring(1, 3));
    message = numbersToTwenty[hundreds] + "hundred";
    if (representTensUnits(tensunits).split("").length >= 1) {
      message += "and" + representTensUnits(tensunits);
    }
  } else if (number >= 10) {
    var tensunits = int.parse(number.toString().substring(0, 2));
    message += representTensUnits(tensunits);
  } else {
    var tensunits = int.parse(number.toString().substring(0, 1));
    message += representTensUnits(tensunits);
  }
  return message;
}

void main() {
  int count = 0;
  for (int i = 0; i <= 1000; i++) {
    count += representNumber(i).split("").length;
  }
  print(count);
}
