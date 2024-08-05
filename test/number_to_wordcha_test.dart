import 'package:number_to_wordcha/number_to_wordcha.dart';
import 'package:test/test.dart';

void main() {
  group('NumberToWords Test', () {
    test('should return "nol" for 0', () {
      final result = NumberToWords.convert(0);
      expect(result, "nol");
    });

    test('should return "bir" for 1', () {
      final result = NumberToWords.convert(1);
      expect(result, "bir");
    });

    test('should return "o\'n ikki" for 12', () {
      final result = NumberToWords.convert(12);
      expect(result, "o'n ikki");
    });

    test('should return "bir yuz o\'n bir" for 111', () {
      final result = NumberToWords.convert(111);
      expect(result, "bir yuz o'n bir");
    });

    test('should return "o\'n ikki ming uch yuz qirq besh" for 12345', () {
      final result = NumberToWords.convert(12345);
      expect(result, "o'n ikki ming uch yuz qirq besh");
    });

    test('should return "minus bir" for -1', () {
      final result = NumberToWords.convert(-1);
      expect(result, "minus bir");
    });

    test('should return "bir milliard" for 1000000000', () {
      final result = NumberToWords.convert(1000000000);
      expect(result, "bir milliard");
    });
  });
}
