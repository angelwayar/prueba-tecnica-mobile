import 'package:mobile/src/shared/extensions/extensions_aux.dart';

extension StringExt on String {
  DateTime toTime() {
    final year = int.parse(split('-')[0]);
    final month = int.parse(split('-')[1]);
    final day = int.parse(split('-')[2]);
    return DateTime(year, month, day);
  }
}

final months = {
  01: 'enero',
  02: 'febrero',
  03: 'marzo',
  04: 'abril',
  05: 'mayo',
  06: 'junio',
  07: 'julio',
  08: 'agosto',
  09: 'septiembre',
  10: 'octubre',
  11: 'noviembre',
  12: 'diciembre',
};

extension DatetimeExt on DateTime {
  String getLiteral() => '$day de ${months[month]} de $year';

  bool isNow() => this == DateTime.now().dateToText().textToTime();

  bool isYesterday() =>
      this ==
      DateTime.now()
          .subtract(const Duration(days: 1))
          .dateToText()
          .textToTime();

  String getLabel() {
    return isNow()
        ? 'Hoy'
        : isYesterday()
            ? 'Ayer'
            : getLiteral();
  }
}
