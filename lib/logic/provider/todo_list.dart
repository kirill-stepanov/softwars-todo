import 'dart:async';

import 'package:flutter/material.dart';

import 'package:softwars_todo/logic/models/todo.dart';
import 'package:softwars_todo/logic/services/api_service.dart';
import 'package:softwars_todo/logic/services/shared_preferences_service.dart';
import 'package:softwars_todo/ui/constants/api_routes.dart';
import 'package:softwars_todo/ui/constants/shared_preferences_keys.dart';

class TodoListProvider with ChangeNotifier {
  List<Todo> _data = [];
  bool _loading = false;

  List<Todo> get data => _data;
  bool get loading => _loading;

  SharedPreferencesService sharedPreferences = SharedPreferencesService();

  Future<void> getTodoList() async {
    _loading = true;
    notifyListeners();

    final List<Todo> storedData =
        sharedPreferences.getTodoList(SharedPreferencesKeys.todos);

    // print('storedData');
    // print(storedData);

    // _data = storedData;

    try {
      final ApiService apiService = ApiService();
      final response = await apiService.get(ApiRoutes.tasks);

      if (response['data'] is List) {
        // _data = (response['data'] as List)
        //     .map((item) => Todo.fromJson(item as Map<String, dynamic>))
        //     .toList();

        _data.addAll(
          (response['data'] as List)
              .map((item) => Todo.fromJson(item as Map<String, dynamic>))
              .toList(),
        );
      }
      // else {
      //   _data = [];
      // }
    } catch (e) {
      print(e);
      _data = storedData;
    } finally {
      _loading = false;
      notifyListeners();
    }

    sharedPreferences.saveTodoList(SharedPreferencesKeys.todos, _data);
  }

  Future<void> createTodo(Todo body) async {
    _loading = true;
    notifyListeners();

    final int index = _data.indexWhere((todo) => todo.taskId == body.taskId);

    if (index != -1) {
      _data[index] = body;
    } else {
      _data.add(body);
    }

    List<Map<String, dynamic>> jsonList =
        _data.map((todo) => todo.toJson()).toList();

    try {
      final ApiService apiService = ApiService();
      final response = await apiService.post(ApiRoutes.tasks, jsonList);

      if (response['data'] is List) {
        _data = (response['data'] as List)
            .map((item) => Todo.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        _data = [];
      }
    } catch (e) {
      print(e);
    } finally {
      _loading = false;
      notifyListeners();
    }

    sharedPreferences.saveTodoList(SharedPreferencesKeys.todos, _data);
    // sharedPreferences.saveTodoList(SharedPreferencesKeys.todos, _data);
  }

  Future<void> changeStatus(String taskId, int status) async {
    _loading = true;
    notifyListeners();

    try {
      final ApiService apiService = ApiService();
      final response = await apiService
          .put('${ApiRoutes.tasks}/$taskId', {'status': status});

      if (response['data'] is List) {
        _data = (response['data'] as List)
            .map((item) => Todo.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        _data = [];
      }
    } catch (e) {
      print(e);
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> deleteTodo(String taskId) async {
    _loading = true;
    notifyListeners();

    _data.removeWhere((todo) => todo.taskId == taskId);

    try {
      final ApiService apiService = ApiService();
      final response = await apiService.delete('${ApiRoutes.tasks}/$taskId');

      if (response['data'] is List) {
        _data = (response['data'] as List)
            .map((item) => Todo.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        _data = [];
      }
    } catch (e) {
      print(e);
    } finally {
      _loading = false;
      notifyListeners();
    }

    // sharedPreferences.saveTodoList(SharedPreferencesKeys.todos, _data);
  }

  Future<void> updateChangesAfterRestoreInternet() async {
    _loading = true;
    notifyListeners();

    List<Map<String, dynamic>> jsonList =
        _data.map((todo) => todo.toJson()).toList();

    try {
      final ApiService apiService = ApiService();
      final response = await apiService.post(ApiRoutes.tasks, jsonList);

      if (response['data'] is List) {
        _data = (response['data'] as List)
            .map((item) => Todo.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        _data = [];
      }
    } catch (e) {
      print(e);
    } finally {
      _loading = false;
      notifyListeners();
    }

    // sharedPreferences.saveTodoList(SharedPreferencesKeys.todos, _data);
  }
}
