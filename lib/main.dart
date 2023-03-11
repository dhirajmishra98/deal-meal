import 'dart:developer';

import 'package:flutter/material.dart';

import '/dummy_data.dart';
import './models/meal.dart';
import './screens/favorite_screen.dart';
import './screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegeterian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = dummyMeals.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegeterian']! && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFilter(String mealId) {
    int existingIndex = _favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(
          dummyMeals.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool isFavourite(String mealId) {
    return _favouriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DealMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 244, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodySmall: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleMedium: const TextStyle(
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
      // home: const CategoriesScreen(),
      home: TabsScreen(
          _favouriteMeals), //if tabs are used we have to return that screen as main screen
      // initialRoute:
      // '/', //we can define initial route key here and use int routes map as key
      routes: {
        // '/': (ctx) =>
        // const TabsScreen(), //this is by default the initial screen loading (default screen initially)
        // '/category-meals' : (ctx) => CategoryMealsScreen(), //we can have typo here in key string so we create static string name in each screen class and use that here
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
            _availableMeals), //above method can be used like this to avoid typo
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFilter,isFavourite),
        // FavouriteScreen.routeName: (ctx) => FavouriteScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters, _setFilters),
      },
      //onGenerateRoute is used when screen/pages are created dynamically we dont now in advance and that's is not registered in routes then it will preoceed here according to condition meets
      // onGenerateRoute: (settings) {
      //   print(settings.name); //print the page it moving to
      //   if(settings.name == '/catergories-screen'){
      //     return ...;
      //   }else if(settings.name == '/meal-details-screen'){
      //     return ...;
      //   }
      //   return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      // },

      //this method is used if above all method fails to find route before flutter throws error (like we reaced to page that doesnot exist in future to prevent we can move to page like 'page doest exist screeen' to prevent app form crash)
      onUnknownRoute: ((settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      }),
    );
  }
}
