// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:traveling_app/screens/trip_details_screen.dart';
import '../screens/trip_detil_screen.dart';
import '../models/trip.dart';

class TripCard extends StatelessWidget {
  final Trip trip;
  //final Function removeCard;

  // ignore: use_key_in_widget_constructors
  const TripCard({
    required this.trip,
    //required this.removeCard,
  });

  String get seasonText {
    switch (trip.season) {
      case Season.Winter:
        return 'شناء';

      case Season.Spring:
        return 'ربيع';

      case Season.Summer:
        return 'صيف';

      case Season.Autumn:
        return 'خريف';

        // ignore: dead_code
        return 'غير معروف';
    }
  }

  String get tripTypeText {
    switch (trip.tripType) {
      case TripType.Exploration:
        return 'استكشاف ';

      case TripType.Recovery:
        return 'نقاهة';

      case TripType.Activities:
        return 'انشطة';

      case TripType.Therapy:
        return 'معالجة';
    }
  }

  void selectTrip(BuildContext context) {
    // Navigator.of(
    //   context,
    // ).pushNamed(TripDetillScreen.screenRoute, arguments: id).then((result) {
    //   if (result != null) {
    //     // removeCard(result);
    //   }
    // });
    Navigator.of(context)
        .pushNamed(TripDetailslScreen.screenRoute, arguments: trip.id)
        .then((result) {
          if (result != null) {
            // removeCard(result);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    trip.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: [0.6, 1],
                    ),
                  ),
                  child: Text(
                    trip.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.today, color: Colors.orangeAccent),
                      SizedBox(width: 6),
                      Text('${trip.duration} أيام'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.wb_sunny, color: Colors.orangeAccent),
                      SizedBox(width: 6),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.family_restroom, color: Colors.orangeAccent),
                      SizedBox(width: 6),
                      Text(tripTypeText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
