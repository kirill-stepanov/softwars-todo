import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softwars_todo/logic/provider/todo_list.dart';
import 'package:softwars_todo/ui/components/button.dart';
import 'package:softwars_todo/ui/constants/app_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoListProvider todoList = Provider.of<TodoListProvider>(context);

    void login() async {
      await todoList.getTodoList();

      if (context.mounted) {
        Navigator.pushNamed(context, AppRoutes.home);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 16,
            right: 16,
            bottom: 206,
          ),
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Button(
              title: 'Вхід',
              onPressed: login,
              loading: todoList.loading,
            ),
          ),
        ),
      ),
    );
  }
}
