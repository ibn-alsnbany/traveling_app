import 'package:flutter/material.dart';
import '../screens/trip_detil_screen.dart';
import './screens/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './screens/category_trips_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryTripsScreen.screenRoute: (ctx) => CategoryTripsScreen(),
        TripDetillScreen.screenRoute: (ctx) => TripDetillScreen(),
      },
    );
  }
}
