import 'package:flutter/material.dart';

import './categories_screen.dart';
import 'favorite_screen.dart';

class UpperTabsScreen extends StatefulWidget {
  @override
  _UpperTabsScreenState createState() => _UpperTabsScreenState();
}

class _UpperTabsScreenState extends State<UpperTabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavouriteScreen(),
          ],
        ),
      ),
    );
  }
}
