import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:softwars_todo/ui/constants/colors.dart';
import 'package:softwars_todo/ui/screens/todo_form/components/field_container.dart';

class TodoFile extends StatelessWidget {
  final Uint8List? file;
  final void Function() onTap;

  const TodoFile({
    super.key,
    required this.file,
    required this.onTap,
  });

  final TextStyle textStyle = const TextStyle(
    color: AppColors.kPrimary,
    fontFamily: 'SF-UI-Display',
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  List<Widget> showContent() {
    if (file != null) {
      return [
        Text('Вкладене зображення', style: textStyle),
        const SizedBox(height: 10),
        Image.memory(file as Uint8List),
      ];
    } else {
      return [
        Text('Прикріпити файл', style: textStyle),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FieldContainer(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: showContent(),
        ),
      ),
    );
  }
}
