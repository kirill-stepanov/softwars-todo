import 'package:flutter/material.dart';

import 'package:softwars_todo/ui/screens/home/components/filters.dart';
import 'package:softwars_todo/ui/screens/home/components/float_button.dart';
import 'package:softwars_todo/ui/screens/home/components/todo_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Filters(),
              SizedBox(height: 24),
              TodoList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatButton(),
    );
  }
}
