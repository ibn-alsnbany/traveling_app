import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';
import '../app_data.dart';

class CategoryTripsScreen extends StatelessWidget {
  static const screenRoute = '/category-trips';
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryId = routeArgument['id'];
    final categoryTitle = routeArgument['title'];
    final filteredTrips =
        Trips_data.where((Trip) {
          return Trip.categories.contains(categoryId);
        }).toList();
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(categoryTitle!))),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: filteredTrips[index].id,
            title: filteredTrips[index].title,
            imageUrl: filteredTrips[index].imageUrl,
            duration: filteredTrips[index].duration,
            tripType: filteredTrips[index].tripType,
            season: filteredTrips[index].season,
          );
        },
        itemCount: filteredTrips.length,
      ),
    );
  }
}
