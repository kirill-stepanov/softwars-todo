import 'package:flutter/material.dart';
import 'package:softwars_todo/logic/models/filter.dart';

class FiltersProvider with ChangeNotifier {
  final List<Filter> _data = [
    const Filter(id: 0, title: 'Усі'),
    const Filter(id: 1, title: 'Робочі'),
    const Filter(id: 2, title: 'Особисті'),
  ];

  int _selectedId = 0;

  List<Filter> get data => _data;
  int get selectedId => _selectedId;

  void changeSelectedId(int newSelectedId) {
    _selectedId = newSelectedId;
    notifyListeners();
  }
}
