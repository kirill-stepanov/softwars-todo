import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softwars_todo/logic/provider/filters.dart';
import 'package:softwars_todo/logic/provider/todo_list.dart';
import 'package:softwars_todo/ui/screens/home/components/todo_list_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoListProvider todoList = Provider.of<TodoListProvider>(context);
    final FiltersProvider filters = Provider.of<FiltersProvider>(context);

    final filteredTodoList = filters.selectedId == 0
        ? todoList.data
        : todoList.data
            .where((todo) => todo.type == filters.selectedId)
            .toList();

    return Expanded(
      child: ListView.builder(
        itemCount: filteredTodoList.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoListItem(
            todo: filteredTodoList[index],
          );
        },
      ),
    );
  }
}
