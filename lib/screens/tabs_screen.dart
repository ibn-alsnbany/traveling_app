import 'package:flutter/material.dart';
import 'package:traveling_app/screens/categories_screen.dart';
import 'package:traveling_app/screens/favorites_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('دليل سياحي '),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.dashboard), text: 'التصنيفات'),
              Tab(icon: Icon(Icons.star_border), text: 'المفضلة'),
            ],
          ),
        ),

        body: TabBarView(children: [CategoriesScreen(), FavoritesScreen()]),
      ),
    );
  }
}
