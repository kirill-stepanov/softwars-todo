import 'package:flutter/material.dart';

import 'package:softwars_todo/ui/constants/colors.dart';

class TodoHeader extends StatelessWidget {
  final TextEditingController? controller;
  final bool showFaveIcon;
  final void Function() onSave;

  const TodoHeader({
    super.key,
    required this.controller,
    required this.showFaveIcon,
    required this.onSave,
  });

  final TextStyle inputTextStyle = const TextStyle(
    color: AppColors.kPrimary,
    fontFamily: 'SF-UI-Display',
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  final Icon backIcon = const Icon(
    Icons.arrow_back,
    color: AppColors.kWarning,
    size: 30,
  );

  final Icon saveIcon = const Icon(
    Icons.done,
    color: AppColors.kWarning,
    size: 30,
  );

  @override
  Widget build(BuildContext context) {
    const TextStyle hintTextStyle = TextStyle(
      color: AppColors.kSecondaryLight,
      fontFamily: 'SF-UI-Display',
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );

    const InputDecoration inputDecoration = InputDecoration(
      border: InputBorder.none,
      hintText: 'Назва завдання...',
      hintStyle: hintTextStyle,
      counterText: '',
    );

    void goBack() => Navigator.pop(context);

    return Row(
      children: [
        IconButton(
          onPressed: goBack,
          icon: backIcon,
        ),
        Expanded(
          child: TextField(
            maxLength: 90,
            controller: controller,
            decoration: inputDecoration,
            style: inputTextStyle,
          ),
        ),
        Visibility(
          visible: showFaveIcon,
          child: IconButton(
            onPressed: onSave,
            icon: saveIcon,
          ),
        )
      ],
    );
  }
}
