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
    super.key,
    required this.title,
    this.onPressed,
    this.loading = false,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(10),
      minimumSize: const Size(double.infinity, 10),
      backgroundColor: buttonColors[type],
      foregroundColor: AppColors.kBlack,
      disabledBackgroundColor: buttonColors[type],
      disabledForegroundColor: AppColors.kBlack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );

    const TextStyle textStyle = TextStyle(
      fontFamily: 'SF-UI-Display',
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );

    const SizedBox icon = SizedBox(
      height: 34,
      width: 34,
      child: CircularProgressIndicator(color: AppColors.kBackground),
    );

    final Widget buttonChild = loading ? icon : Text(title, style: textStyle);

    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      style: buttonStyle,
      child: buttonChild,
    );
  }
}
