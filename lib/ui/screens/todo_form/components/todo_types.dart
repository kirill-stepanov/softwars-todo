import 'package:flutter/material.dart';

import 'package:softwars_todo/ui/components/radio_button.dart';
import 'package:softwars_todo/ui/screens/todo_form/components/field_container.dart';

class TodoTypes extends StatelessWidget {
  final int groupValue;
  final ValueChanged<int> onChanged;

  const TodoTypes({
    super.key,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FieldContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RadioButton(
            label: 'Робочі',
            value: 1,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          RadioButton(
            label: 'Особисті',
            value: 2,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
