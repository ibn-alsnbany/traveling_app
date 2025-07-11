import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  static const screenRoute = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('الفلترة')),
      drawer: AppDrawer(),
      body: Center(child: Text('هذة صفحة الفلترة')),
    );
  }
}
