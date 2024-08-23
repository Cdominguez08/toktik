import 'package:intl/intl.dart';

class HumanFormats {
  static String humanReadableNumber(double value) {
    return NumberFormat.compactCurrency(decimalDigits: 0, symbol: "")
        .format(value);
  }
}
