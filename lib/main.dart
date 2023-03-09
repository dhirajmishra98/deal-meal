import 'package:flutter/material.dart';

import '../screens/favorite_screen.dart';
import '../screens/filter_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/tabs_screen.dart';
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
      home:
          const TabsScreen(), //if tabs are used we have to return that screen as main screen
      // initialRoute:
      // '/', //we can define initial route key here and use int routes map as key
      routes: {
        // '/': (ctx) =>
        // const TabsScreen(), //this is by default the initial screen loading (default screen initially)
        // '/category-meals' : (ctx) => CategoryMealsScreen(), //we can have typo here in key string so we create static string name in each screen class and use that here
        CategoryMealsScreen.routeName: (ctx) =>
            const CategoryMealsScreen(), //above method can be used like this to avoid typo
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        FavouriteScreen.routeName: (ctx) => const FavouriteScreen(),
        FilterScreen.routeName: (ctx) => const FilterScreen(),
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
