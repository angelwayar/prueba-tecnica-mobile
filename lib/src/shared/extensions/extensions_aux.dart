extension DateTimeExt on DateTime {
  String dateToText() {
    final day = this.day.toString().padLeft(2, '0');
    final month = this.month.toString().padLeft(2, '0');
    return '$day/$month/$year';
  }
}

extension StringExt on String {
  DateTime textToTime() {
    final day = int.parse(split('/')[0]);
    final month = int.parse(split('/')[1]);
    final year = int.parse(split('/')[2]);
    return DateTime(year, month, day);
  }
}