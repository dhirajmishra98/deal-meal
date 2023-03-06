import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

 Widget BuildListTile(BuildContext context,String title, IconData icon) {
    return ListTile(
      leading:  Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      onTap: () {},
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
          BuildListTile(context, 'Meals', Icons.restaurant),
          BuildListTile(context, 'Settings', Icons.settings),
        ],
      ),
    );
  }
}
