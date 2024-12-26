import 'package:flutter/material.dart';
import 'package:softwars_todo/ui/constants/colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final Color customBorderColor;
  final void Function(bool) onChanged;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    this.customBorderColor = AppColors.kSecondary,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final Widget checked = Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.kWarningLight,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 2,
          color: AppColors.kSecondary,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.done,
          color: AppColors.kSecondary,
          size: 24,
        ),
      ),
    );

    final Widget unChecked = Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 2,
          color: customBorderColor,
        ),
      ),
    );

    return GestureDetector(
      onTap: () => onChanged(!isChecked),
      child: isChecked ? checked : unChecked,
    );
  }
}
