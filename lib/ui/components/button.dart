import 'package:flutter/material.dart';
import 'package:softwars_todo/ui/constants/colors.dart';

enum ButtonType { primary, danger }

const Map<ButtonType, Color> buttonColors = {
  ButtonType.primary: AppColors.kWarning,
  ButtonType.danger: AppColors.kDanger,
};

class Button extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool loading;
  final ButtonType type;

  const Button({
    Key? key,
    required this.title,
    this.onPressed,
    this.loading = false,
    this.type = ButtonType.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: buttonColors[type],
      foregroundColor: AppColors.kBlack,
      padding: const EdgeInsets.all(10),
      minimumSize: const Size(double.infinity, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );

    const TextStyle textStyle = TextStyle(
      fontFamily: 'SF-UI-Display',
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );

    final Widget buttonChild = loading
        ? const CircularProgressIndicator(color: AppColors.kBackground)
        : Text(title, style: textStyle);

    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      style: buttonStyle,
      child: buttonChild,
    );
  }
}
