import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/widgets/trip_card.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    var favoriteTrips = Trips_data.where((trip) => trip.isFavorite).toList();
    if (favoriteTrips.isEmpty) {
      return Container(
        child: Center(child: Text('ليس هناك اي رحلات في قائمة المفضلة لديك')),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TripCard(
            trip: favoriteTrips[index],
            // removeItem:favoriteTrips,
          );
        },
        itemCount: favoriteTrips.length,
      );
    }
  }
}
