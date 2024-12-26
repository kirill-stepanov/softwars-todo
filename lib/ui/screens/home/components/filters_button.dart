import 'package:flutter/material.dart';

import 'package:softwars_todo/ui/constants/colors.dart';

class FiltersButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final void Function() onPressed;

  const FiltersButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      fontFamily: 'SF-UI-Display',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: isSelected ? AppColors.kSecondary : AppColors.kWarningLight,
    );

    final ButtonStyle buttonStyle = OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      side: const BorderSide(
        width: 1,
        color: AppColors.kWarningLight,
      ),
      minimumSize: const Size(109, 27),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      backgroundColor:
          isSelected ? AppColors.kWarningLight : AppColors.kBackground,
    );

    return OutlinedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: Text(title, style: textStyle),
    );
  }
}
