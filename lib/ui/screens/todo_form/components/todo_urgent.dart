import 'package:flutter/material.dart';

import 'package:softwars_todo/ui/components/custom_checkbox.dart';
import 'package:softwars_todo/ui/constants/colors.dart';
import 'package:softwars_todo/ui/screens/todo_form/components/field_container.dart';

class TodoUrgent extends StatelessWidget {
  final int isUrgent;
  final void Function(int?) onChangeIsUrgent;

  const TodoUrgent({
    super.key,
    required this.isUrgent,
    required this.onChangeIsUrgent,
  });

  final TextStyle textStyle = const TextStyle(
    color: AppColors.kPrimary,
    fontFamily: 'SF-UI-Display',
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return FieldContainer(
      child: Row(
        children: [
          CustomCheckbox(
            isChecked: isUrgent == 1,
            customBorderColor: AppColors.kPrimary,
            onChanged: (bool? value) {
              if (value != null) {
                onChangeIsUrgent(value ? 1 : 0);
              }
            },
          ),
          const SizedBox(width: 8),
          Text('Термінове', style: textStyle),
        ],
      ),
    );
  }
}
