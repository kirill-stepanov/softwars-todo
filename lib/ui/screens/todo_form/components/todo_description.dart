import 'package:flutter/material.dart';
import 'package:softwars_todo/ui/constants/colors.dart';
import 'package:softwars_todo/ui/screens/todo_form/components/field_container.dart';

class TodoDescription extends StatelessWidget {
  final TextEditingController? controller;

  const TodoDescription({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle inputTextStyle = TextStyle(
      color: AppColors.kPrimary,
      fontFamily: 'SF-UI-Display',
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    const InputDecoration inputDecoration = InputDecoration(
      border: InputBorder.none,
      hintText: 'Додати опис...',
      hintStyle: inputTextStyle,
    );

    return FieldContainer(
      child: TextField(
        controller: controller,
        decoration: inputDecoration,
        style: inputTextStyle,
        maxLines: 4,
      ),
    );
  }
}
