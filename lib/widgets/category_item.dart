import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(
      {required this.id, required this.title, required this.color, super.key});

  void selectedScreen(BuildContext ctx) {
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(builder: (_) {
    //     return CategoryMealsScreen(categoryId: id, categoryTitle: title,);
    //   },),
    // );

    // Navigator.of(ctx)
    //     .pushNamed('/category-meals', arguments: {'id': id, 'title': title});

    Navigator.of(ctx)
        .pushNamed(CategoryMealsScreen.routeName, arguments: {'id': id, 'title': title}); //access using routename define in mealscreen to avoid typo erro
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedScreen(context),
      splashColor: color,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.4),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
