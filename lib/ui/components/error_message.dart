import 'package:flutter/material.dart';

import 'package:softwars_todo/ui/constants/colors.dart';

class ErrorMessage extends StatelessWidget {
  final String errorMessage;
  final bool showErrorMessage;

  const ErrorMessage({
    super.key,
    this.errorMessage = "Обов'язкове поле*",
    this.showErrorMessage = false,
  });

  final textStyle = const TextStyle(
    fontFamily: 'SF-UI-Display',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.kDanger,
  );

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showErrorMessage,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
        child: Text(
          errorMessage,
          style: textStyle,
        ),
      ),
    );
  }
}
