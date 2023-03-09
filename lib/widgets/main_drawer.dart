import 'package:flutter/material.dart';
import 'package:meal_tracker/screens/filter_screen.dart';
import 'package:meal_tracker/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(BuildContext context, String title, IconData icon,
      VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            // margin: const EdgeInsets.all(5),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(context, 'Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
          }),
          buildListTile(context, 'Filter', Icons.settings, () {
            // Navigator.of(context).pushNamed(FilterScreen.routeName); //pushname just add pages to pages on stack on top that makes it more heavy
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName); //this just replace the page instead push to stack of pages
            //login page is use case of it where after login we dont want option to go back. so replace page
          }),
        ],
      ),
    );
  }
}
