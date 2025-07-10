import 'package:flutter/material.dart';

class TripDetillScreen extends StatelessWidget {
  static const screenRoute = '/trip-detil';

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('$tripId')),
      body: Center(child: Text('$tripId هذه صفحة تفاصيل الرحلة')),
    );
  }
}
