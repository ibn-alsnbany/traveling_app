// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import '../app_data.dart';

class TripDetailslScreen extends StatefulWidget {
  static const screenRoute = '/trip-details';

  final Trip trip;

  TripDetailslScreen({required this.trip});

  @override
  State<TripDetailslScreen> createState() => _TripDetailslScreenState();
}

class _TripDetailslScreenState extends State<TripDetailslScreen> {
  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.centerRight,
      child: Text(titleText, style: Theme.of(context).textTheme.headlineMedium),
    );
  }

  Widget buildListViewContainar(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = this.widget.trip;

    return Scaffold(
      // ignore: unnecessary_string_interpolations
      appBar: AppBar(title: Text('${selectedTrip.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedTrip.imageUrl, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            buildSectionTitle(context, 'الأنشطة'),
            buildListViewContainar(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder:
                    (context, index) => Card(
                      elevation: 0.3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(selectedTrip.activities[index]),
                      ),
                    ),
              ),
            ),
            SizedBox(height: 10),
            buildSectionTitle(context, 'البرنامج اليومي'),
            buildListViewContainar(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder:
                    (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('يوم ${index + 1}'),
                          ),
                          title: Text(selectedTrip.program[index]),
                        ),
                        Divider(),
                      ],
                    ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(selectedTrip.isFavorite ? Icons.star : Icons.star_border),
        onPressed:
            () => {
              setState(() {
                selectedTrip.isFavorite = !selectedTrip.isFavorite;
              }),
            },
      ),
    );
  }
}
