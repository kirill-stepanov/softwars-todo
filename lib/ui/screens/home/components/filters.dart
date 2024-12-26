import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softwars_todo/logic/provider/filters.dart';
import 'package:softwars_todo/ui/screens/home/components/filters_button.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    final FiltersProvider filters = Provider.of<FiltersProvider>(context);

    List<Widget> renderFiltersButtons() {
      return filters.data.map((filter) {
        return FiltersButton(
          title: filter.title,
          isSelected: filter.id == filters.selectedId,
          onPressed: () => filters.changeSelectedId(filter.id),
        );
      }).toList();
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 8,
          children: renderFiltersButtons(),
        ),
      ),
    );
  }
}
