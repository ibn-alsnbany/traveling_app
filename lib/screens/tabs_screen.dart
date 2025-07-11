import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  int _selectScreenIndex = 0;

  final List<Map<String, Object>> _screen = [
    {'Screen': CategoriesScreen(), 'Title': 'تصنيفات الرحلات '},
    {'Screen': FavoritesScreen(), 'Title': 'الرحلات المفضلة'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(_screen[_selectScreenIndex]['Title'] as String),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: AppDrawer(),
      body: _screen[_selectScreenIndex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: _selectScreenIndex,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),

          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'المفضلة'),
        ],
      ),
    );
  }
}
