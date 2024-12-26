import 'package:flutter/material.dart';
import 'package:softwars_todo/ui/constants/colors.dart';

class SnackbarService {
  void showSnackbar(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 2),
  }) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        showCloseIcon: true,
        backgroundColor: AppColors.kPrimary,
        closeIconColor: AppColors.kSecondary,
        content: Text(
          message,
          style: const TextStyle(
            fontFamily: 'SF-UI-Display',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.kSecondary,
          ),
        ),
      ),
    );
  }
}
