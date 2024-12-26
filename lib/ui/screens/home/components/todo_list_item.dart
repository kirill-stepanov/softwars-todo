import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:softwars_todo/logic/models/todo.dart';
import 'package:softwars_todo/logic/provider/todo_list.dart';
import 'package:softwars_todo/logic/services/snackbar_service.dart';
import 'package:softwars_todo/logic/utils/date_formatting.dart';

import 'package:softwars_todo/ui/components/custom_checkbox.dart';
import 'package:softwars_todo/ui/constants/app_routes.dart';
import 'package:softwars_todo/ui/constants/colors.dart';
import 'package:softwars_todo/ui/screens/todo_form/index.dart';

class TodoListItem extends StatefulWidget {
  final Todo todo;

  const TodoListItem({
    super.key,
    required this.todo,
  });

  @override
  State<TodoListItem> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  final SnackbarService _snackbarService = SnackbarService();

  int _todoStatus = 1;

  Future<void> _changeStatus() async {
    final TodoListProvider todoList =
        Provider.of<TodoListProvider>(context, listen: false);

    await todoList.changeStatus(widget.todo.taskId, _todoStatus);
    _snackbarService.showSnackbar(context, 'Статус оновлено');
  }

  void _changeTodoStatus(bool? newValue) {
    if (newValue != null) {
      setState(() {
        _todoStatus = _todoStatus == 2 ? 1 : 2;
      });

      _changeStatus();
    }
  }

  void _openTodo() {
    Navigator.pushNamed(
      context,
      AppRoutes.todoForm,
      arguments: TodoFormArguments(
        formType: TodoFormType.change,
        initialTodo: widget.todo,
      ),
    );
  }

  final TextStyle titleStyle = TextStyle(
    fontFamily: 'SF-UI-Display',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.kSecondary,
  );

  final TextStyle subtitleStyle = TextStyle(
    fontFamily: 'SF-UI-Display',
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.kSecondary,
  );

  @override
  void initState() {
    _todoStatus = widget.todo.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openTodo,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:
              widget.todo.urgent == 1 ? AppColors.kDanger : AppColors.kPrimary,
        ),
        child: Row(
          children: [
            if (widget.todo.type == 1)
              const Icon(
                Icons.work_outline,
                color: AppColors.kSecondary,
                size: 30,
              ),
            if (widget.todo.type == 2)
              const Icon(
                Icons.home_outlined,
                color: AppColors.kSecondary,
                size: 30,
              ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.todo.name,
                    style: titleStyle,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                  Text(
                    formatDateToNumeric(widget.todo.finishDate),
                    style: subtitleStyle,
                  )
                ],
              ),
            ),
            CustomCheckbox(
              isChecked: _todoStatus == 2,
              onChanged: _changeTodoStatus,
            ),
          ],
        ),
      ),
    );
  }
}
