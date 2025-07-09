import 'package:flutter/material.dart';

class CategoryTripsScreen extends StatelessWidget {
  const CategoryTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('صفحة الرحلات'))),
      body: Center(child: Text('قائمة برحلات هذا التصنيف')),
    );
  }
}
