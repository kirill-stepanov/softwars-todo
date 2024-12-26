import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:softwars_todo/logic/models/todo.dart';

class SharedPreferencesService {
  SharedPreferences? _prefs;

  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  factory SharedPreferencesService() => _instance;

  SharedPreferencesService._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveTodoList(String key, List<Todo> todoList) async {
    final String jsonString =
        jsonEncode(todoList.map((todo) => todo.toJson()).toList());
    await _prefs?.setString(key, jsonString);
  }

  List<Todo> getTodoList(String key) {
    final String? jsonString = _prefs?.getString(key);
    if (jsonString == null) return [];

    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => Todo.fromJson(json)).toList();
  }
}
