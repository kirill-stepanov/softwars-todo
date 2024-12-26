import 'package:date_picker_plus/date_picker_plus.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:softwars_todo/logic/utils/date_formatting.dart';
import 'package:softwars_todo/ui/constants/colors.dart';
import 'package:softwars_todo/ui/screens/todo_form/components/field_container.dart';

class TodoDatepicker extends StatelessWidget {
  final DateTime? date;
  final void Function(dynamic) onChangeDate;

  const TodoDatepicker({
    super.key,
    required this.date,
    required this.onChangeDate,
  });

  final TextStyle textStyle = const TextStyle(
    color: AppColors.kPrimary,
    fontFamily: 'SF-UI-Display',
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    Future showDatePicker() async {
      final DateTime today = DateTime.now();
      final DateTime minDate = today;
      final DateTime maxDate = today.add(const Duration(days: 365));

      final DateTime? newDate = await showDatePickerDialog(
        context: context,
        minDate: minDate,
        maxDate: maxDate,
        selectedDate: date,
      );

      if (newDate != null) {
        onChangeDate(newDate);
      }
    }

    return FieldContainer(
      child: GestureDetector(
        onTap: showDatePicker,
        child: date != null
            ? Text(formatDateToUkrainian(date!), style: textStyle)
            : Text('Дата завершення:', style: textStyle),
      ),
    );
  }
}
