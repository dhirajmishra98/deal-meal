import 'package:flutter/material.dart';
import 'package:meal_tracker/widgets/meal_item.dart';

import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DealMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),
        canvasColor:const Color.fromRGBO(255, 244, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyMedium: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodySmall:const TextStyle(color: Color.fromRGBO(20, 51, 51, 1),),
          titleMedium:const TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
          titleSmall: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home:const CategoriesScreen(),
      // initialRoute: '/', //we can define initial route key here and use int routes map as key
      routes: {
        // '/' : (ctx) => const CategoriesScreen(), //this is by default the initial screen loading (default screen initially)
        // '/category-meals' : (ctx) => CategoryMealsScreen(), //we can have typo here in key string so we create static string name in each screen class and use that here
        CategoryMealsScreen.routeName : (ctx) => const CategoryMealsScreen(), //above method can be used like this to avoid typo
      },
    );
  }
}