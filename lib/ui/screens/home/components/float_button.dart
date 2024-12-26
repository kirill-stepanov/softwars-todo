import 'package:flutter/material.dart';

import 'package:softwars_todo/ui/constants/app_routes.dart';
import 'package:softwars_todo/ui/constants/colors.dart';
import 'package:softwars_todo/ui/screens/todo_form/index.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    void openTodoForm() {
      Navigator.pushNamed(
        context,
        AppRoutes.todoForm,
        arguments: TodoFormArguments(formType: TodoFormType.create),
      );
    }

    return SizedBox(
      width: 64,
      height: 64,
      child: FloatingActionButton(
        onPressed: openTodoForm,
        foregroundColor: AppColors.kSecondary,
        backgroundColor: AppColors.kWarning,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(
          Icons.add,
          color: AppColors.kSecondary,
          size: 40,
        ),
      ),
    );
  }
}
