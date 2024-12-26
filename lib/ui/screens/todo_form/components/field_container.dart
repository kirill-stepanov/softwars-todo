import 'package:flutter/material.dart';
import 'package:softwars_todo/ui/constants/colors.dart';

class FieldContainer extends StatelessWidget {
  final Widget child;

  const FieldContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      color: AppColors.kSecondary,
      child: child,
    );
  }
}
