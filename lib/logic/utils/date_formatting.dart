import 'package:intl/intl.dart';

String formatDateToUkrainian(DateTime date) {
  const List<String> monthsUkrainian = [
    'січня',
    'лютого',
    'березня',
    'квітня',
    'травня',
    'червня',
    'липня',
    'серпня',
    'вересня',
    'жовтня',
    'листопада',
    'грудня'
  ];

  String day = DateFormat('d').format(date);
  String month = monthsUkrainian[date.month - 1];
  String year = DateFormat('y').format(date);

  return '$day $month $year';
}

String formatDateToNumeric(DateTime date) {
  return DateFormat('dd.MM.yyyy').format(date);
}
