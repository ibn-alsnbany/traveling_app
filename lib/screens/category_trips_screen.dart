import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import '../app_data.dart';

class CategoryTripsScreen extends StatelessWidget {
  static const screenRoute = '/category-trips';
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryId = routeArgument['id'];
    final categoryTitle = routeArgument['title'];
    final filterTrips =
        Trips_data.where((Trip) {
          return Trip.categories.contains(categoryId);
        }).toList();
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(categoryTitle!))),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(filterTrips[index].title);
        },
        itemCount: filterTrips.length,
      ),
    );
  }
}
