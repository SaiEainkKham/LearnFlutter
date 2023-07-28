import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:great_place/providers/great_places.dart';
import 'package:great_place/screens/add_place_screen.dart';
import 'package:great_place/screens/place_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
          title: 'Great Places',
          theme: ThemeData(
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Colors.indigo,
              onPrimary: Colors.white,
              secondary: Colors.amber,
              onSecondary: Colors.black,
              error: Colors.red,
              onError: Colors.white,
              background: Colors.blue,
              onBackground: Colors.white,
              surface: Colors.grey,
              onSurface: Colors.black26,
            ),
          ),
          home: PlaceListScreen(),
          routes: {
            AddPlaceScreen.routeName: (ctx) => const AddPlaceScreen(),
          }),
    );
  }
}
