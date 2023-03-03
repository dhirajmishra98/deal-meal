import 'package:flutter/material.dart';
import 'package:meal_tracker/dummy_data.dart';
import 'package:meal_tracker/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName =
      '/category-meals'; //this string can be access from any class and cannoot be changed, used for nameroutes in main file or anywhere

  const CategoryMealsScreen({super.key});
  // final String categoryId;
  // final String categoryTitle;
  // const CategoryMealsScreen({required this.categoryId,required this.categoryTitle, super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = dummyMeals.where((meals) {
      return meals.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
