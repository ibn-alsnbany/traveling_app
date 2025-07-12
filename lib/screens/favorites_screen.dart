import 'package:flutter/material.dart';
import '../widgets/trip_item.dart';
import '../models/trip.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Trip> favoriteTrips;

  FavoritesScreen(this.favoriteTrips);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    if (favoriteTrips.isEmpty) {
      return Container(
        child: Center(child: Text('ليس هناك اي رحلات في قائمة المفضلة لديك')),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: favoriteTrips[index].id,
            title: favoriteTrips[index].title,
            imageUrl: favoriteTrips[index].imageUrl,
            duration: favoriteTrips[index].duration,
            tripType: favoriteTrips[index].tripType,
            season: favoriteTrips[index].season,
            // removeItem:favoriteTrips,
          );
        },
        itemCount: favoriteTrips.length,
      );
    }
  }
}
