library number_to_words;

class NumberToWords {
  static const List<String> _units = [
    "",
    "bir",
    "ikki",
    "uch",
    "to'rt",
    "besh",
    "olti",
    "yetti",
    "sakkiz",
    "to'qqiz"
  ];

  static const List<String> _tens = [
    "",
    "o'n",
    "yigirma",
    "o'ttiz",
    "qirq",
    "ellik",
    "oltmish",
    "yetmish",
    "sakson",
    "to'qson"
  ];

  static const List<String> _thousands = [
    "",
    "ming",
    "million",
    "milliard",
    "trillion"
  ];

  static String convert(int number) {
    if (number == 0) return "nol";
    if (number < 0) return "minus ${convert(-number)}";

    int thousandIndex = 0;
    String words = "";

    while (number > 0) {
      int remainder = number % 1000;
      if (remainder != 0) {
        String part = _convertHundreds(remainder);
        words = part +
            (thousandIndex > 0 ? " ${_thousands[thousandIndex]}" : "") +
            " " +
            words;
      }
      thousandIndex++;
      number ~/= 1000;
    }

    return words.trim();
  }

  static String _convertHundreds(int number) {
    String words = "";

    if (number > 99) {
      words += _units[number ~/ 100] + " yuz ";
      number %= 100;
    }

    if (number >= 10 && number < 20) {
      // 10-19 oralig'idagi sonlar uchun (o'n, o'n bir, o'n ikki va hokazo)
      words += _tens[number ~/ 10] + " " + _units[number % 10];
    } else if (number >= 20) {
      // 20 va undan katta sonlar uchun (yigirma, o'ttiz va hokazo)
      words += _tens[number ~/ 10] + " ";
      number %= 10;
    }

    if (number > 0 && number < 10) {
      words += _units[number] + " ";
    }

    return words.trim();
  }
}
