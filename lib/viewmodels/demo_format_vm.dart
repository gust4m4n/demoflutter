import 'package:intl/intl.dart';

class DemoFormatVM {
  static String currency({required value, bool prefix = true}) {
    final currencyFormatter = NumberFormat('#,##0', 'ID');
    if (prefix == true) {
      return 'Rp. ${currencyFormatter.format(value)}';
    } else {
      return '${currencyFormatter.format(value)}';
    }
  }
}
