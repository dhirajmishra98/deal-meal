import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('DealMeals'), centerTitle: true,),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, //if device width <=200, one child in each exis, looks like list, if >then adjust no. of childs possible like 500width can keep 2child in main axis
          childAspectRatio: 3 / 2, //if height is 300, width will be 200 (ratio of height:width of child widgets)
          mainAxisSpacing: 30, //spacing between two up down childs
          crossAxisSpacing: 20, //spacing between side by side childs
        ),
        children: dummyCategories
            .map((e) => CategoryItem(id: e.id,title: e.title, color: e.color))
            .toList(),
      ),
    );
  }
}
