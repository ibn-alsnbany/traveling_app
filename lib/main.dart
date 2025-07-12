import 'package:flutter/material.dart';
import '../app_data.dart';
import '../models/trip.dart';
import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/trip_detil_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './screens/category_trips_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> _availableTrips = Trips_data;

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableTrips =
          Trips_data.where((trip) {
            if (_filters['summer'] == true && trip.isInSummer != true) {
              return false;
            }
            if (_filters['winter'] == true && trip.isInWinter != true) {
              return false;
            }
            if (_filters['family'] == true && trip.isForFamilies != true) {
              return false;
            }
            return true;
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // English
      ],
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: Colors.blue,
            fontSize: 24.0,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (ctx) => TabsScreen(),
        CategoryTripsScreen.screenRoute:
            (ctx) => CategoryTripsScreen(_availableTrips),
        TripDetillScreen.screenRoute: (ctx) => TripDetillScreen(),
        FiltersScreen.screenRoute:
            (ctx) => FiltersScreen(_filters, _changeFilters),
      },
    );
  }
}
