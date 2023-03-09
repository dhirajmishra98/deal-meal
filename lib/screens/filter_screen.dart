import 'package:flutter/material.dart';
import 'package:meal_tracker/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filter-screen';
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('dummy')));
  }
}
