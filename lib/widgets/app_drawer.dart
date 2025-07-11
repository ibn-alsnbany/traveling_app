import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  ListTile buildListTille(String title, IconData icon, VoidCallback onTapLink) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Colors.blue),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Elmessiri',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amberAccent,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          SizedBox(height: 20),
          buildListTille('الرحلات', Icons.card_travel, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTille('فلترة', Icons.filter_list, () {
            Navigator.of(
              context,
            ).pushReplacementNamed(FiltersScreen.screenRoute);
          }),
        ],
      ),
    );
  }
}
