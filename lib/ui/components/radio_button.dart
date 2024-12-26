import 'package:flutter/material.dart';
import 'package:softwars_todo/ui/constants/colors.dart';

class RadioButton extends StatelessWidget {
  final String label;
  final int value;
  final int groupValue;
  final ValueChanged<int> onChanged;

  const RadioButton({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final TextStyle textStyle = const TextStyle(
    fontFamily: 'SF-UI-Display',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.kPrimary,
  );

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: AppColors.kPrimary,
                  shape: BoxShape.circle,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.kWarning : AppColors.kPrimary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: textStyle,
          )
        ],
      ),
    );
  }
}
