import 'package:flutter/material.dart';
import 'package:meal_tracker/models/meal.dart';

import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  static const routeName = '/favorite-screen';
   final List<Meal> favouriteMeals;
  FavouriteScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty){
      return Center(child: Text('You have no favourites yet!\nadd them up!'));
    }else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
